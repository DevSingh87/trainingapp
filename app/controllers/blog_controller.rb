class BlogController < ApplicationController
  respond_to :html
  def index
   @blogs = Article.all
   respond_with(@blog)
  end

  def show
   @blog = Article.find(params[:id])
   respond_with(@blog)
  end
end
