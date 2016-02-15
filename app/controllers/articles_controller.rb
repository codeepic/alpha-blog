class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    # @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def update
    # @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = 'Article updated successfully'
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)

    if @article.save
      flash[:success] = 'Article was successfully created'
      redirect_to article_path(@article)
    else
      render 'new' # you can also write render :new
    end
  end

  def destroy
    # @article = Article.find(params[:id])
    @article.destroy
    flash[:danger] = 'Article deleted successfully.'
    redirect_to articles_path # or redirect_to :index
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end
end