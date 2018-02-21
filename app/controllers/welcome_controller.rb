class WelcomeController < ApplicationController
  def index
  	@products = Product.paginate(:page => params[:page], :per_page => 6)
  	@posts = Post.paginate(:page => params[:page], :per_page => 3)
  	@meta_title = meta_title 'Top Quality Hand Made Pilates Product'
  end

  def about
  end
end
