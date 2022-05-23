class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  def index
    @articles = Article.all
  end

  def show

  end

  def new
    @article = Article.new
  end

   def create
    @article = Article.new(articles_params)
    if @article.save 
    redirect_to articles_path
  else
    render :new, status: :unprocessable_entity
  end
  end

  def edit
  end

  def update
  if @article.update(articles_params)
     redirect_to articles_path
  else
    render :edit, status: :unprocessable_entity
  
  end
  end

  def destroy 
  @article.destroy
  redirect_to articles_path
  end
  private
  def articles_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
  
end
