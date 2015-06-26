class ArticlesController < ApplicationController
	include ArticlesHelper

def index
  @articles = Article.all
end

def show
	@article = Article.find(params[:id])
  @comment = Comment.new
end
before_filter :require_login, except: [:new, :create]
def new
	@article = Article.new
end
before_filter :require_login, except: [:new, :create]
 def create
    @article = Article.new(article_params)
    @article.save

    redirect_to article_path(@article)
 end
before_filter :require_login, except: [:new, :create]
def edit
  @article = Article.find(params[:id])
end

def article_params
  params.require(:article).permit(:title, :body)
end
before_filter :require_login, except: [:new, :create]
def update
  @article = Article.find(params[:id])
  @article.update(article_params)

  flash.notice = "Article '#{@article.title}' Updated!"

  redirect_to article_path(@article)
end

before_filter :require_login, except: [:new, :create]
def destroy
end


end
