class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "Article was succcessfully created"
      redirect_to article_path(@article)
    else
      render 'new' # you can also write render :new
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end