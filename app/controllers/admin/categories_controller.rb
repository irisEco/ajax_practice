class Admin::CategoriesController < ApplicationController

  def index
    @categories = Admin::Category.all
  end

  def new
    @categories = Admin::Category.new
  end

  def create
    @categories = Admin::Category.create(categories_params)
    @categories.save

    redirect_to admin_categories_path
  end

  def show
    @categories = Admin::Category.find(params[:id])
  end

  def categories_params
    params.require(:admin_category).permit(:title,:description)

  end


end