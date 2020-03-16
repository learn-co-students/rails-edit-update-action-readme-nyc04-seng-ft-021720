class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = get_article
  end

  def new
    # create a blank instance so that form_for will work.
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:article][:title]
    @article.description = params[:article][:description]
    @article.save
    redirect_to article_path(@article)
  end

  def edit
    @article = get_article
  end

  def update
    @article = Article.find(params[:id])
    @article.update(
      title: params[:article][:title],
      description: params[:article][:description]
    )
    redirect_to article_path(@article)
  end

  private

  def get_article
    Article.find(params[:id])
  end


end
