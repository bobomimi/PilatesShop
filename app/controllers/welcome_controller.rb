class WelcomeController < ApplicationController
  def index
  	@posts = Post.paginate(:page => params[:page], :per_page => 3)
  	@products = Product.paginate(:page => params[:page], :per_page => 3)
  end

  def about
  end
end
