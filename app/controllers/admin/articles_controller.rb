class Admin::ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(articles_params)
    # binding.pry
    @article.save
    redirect_to admin_articles_path
  end

  def index
    @article = Article.all
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to admin_articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.create(articles_params)

    redirect_to admin_articles_path
  end

  def show
    @article = Article.find(params[:id])
  end

  def test
    render "admin/articles/test"
  end



  private

  def articles_params
    params.require(:article).permit(:title, :content, :category_id, :author)
  end
end