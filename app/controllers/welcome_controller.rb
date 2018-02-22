class WelcomeController < ApplicationController
  def index
  	@products = Product.paginate(:page => params[:page], :per_page => 3)
  	@posts = Post.paginate(:page => params[:page], :per_page => 3)
  end

  def about
  end
end
