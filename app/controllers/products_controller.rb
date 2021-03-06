class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  include Hypermicrodata::Rails::HtmlBasedJsonRenderer
  # GET /products
  # GET /products.json
  def index
    @products = Product.paginate(:page => params[:page], :per_page => 6)
    fresh_when(etag: @products, last_modified: @products.maximum(:updated_at))
  end
  # GET /products/1
  # GET /products/1.json
  def show
    fresh_when(@products)
    @og_properties = {
      title: @meta_title,
      type:  @product.title,
      description: @product.sub_title,
      image: @product.image(:thumb),  # this file should exist in /app/assets/images/logo.png
      url: @canonical_url
    }
    
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :image, :price, :sub_title)
    end
end
