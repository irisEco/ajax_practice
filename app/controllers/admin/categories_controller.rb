class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @categories = Category.new
  end

  def create
    @categories = Category.create(categories_params)
    @categories.save

    redirect_to admin_categories_path
  end

  def edit
    @categories = Category.find(params[:id])
  end

  def update
    @categories = Category.update(categories_params)

    redirect_to admin_categories_path
  end

  def destroy
    @categories = Category.find(params[:id])
    @categories.destroy

    redirect_to admin_categories_path
  end

  def show
    @categories = Category.find(params[:id])
    @article = @categories.articles
  end

  def categories_params
    params.require(:category).permit(:title,:description)

  end


end