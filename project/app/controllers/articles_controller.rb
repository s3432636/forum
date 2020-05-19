class ArticlesController < ApplicationController
    
  def index
      @articles = Article.all
      @users = User.all
      @topics = Article.distinct.pluck(:topic)
  end

  def show
      @article = Article.find(params[:id])
      @users = User.all
      @topics = Article.distinct.pluck(:topic)
  end
  
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
      @article = Article.new(article_params)
      @article.user_id = current_user.id
      @article.user = current_user.username
      @article.viewcount = 0
      @article.commentcount = 0
     
      if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
   
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
   
    redirect_to articles_path
  end

     
  private
    def article_params
      params.require(:article).permit(:title, :text, :user, :topic)
    end

end