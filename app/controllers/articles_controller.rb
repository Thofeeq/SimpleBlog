class ArticlesController < ApplicationController
  before_action :get_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.order('created_at DESC').paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      flash[:success] = "Article was successfully created!"
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @article.destroy
    flash[:danger] = "Article was successfully deleted!"
    redirect_to articles_path 
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated!"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end
  private
    def get_article
    @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :body)
    end
end