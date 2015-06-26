class AuthorSessionsController < ApplicationController

before_filter :require_login, except: [:new, :create]
  def new
  end


before_filter :require_login, except: [:new, :create]

  def create
    if login(params[:email], params[:password])
      redirect_back_or_to(articles_path, notice: 'Logged in successfully.')
    else
      flash.now.alert = "Login failed."
      render action: :new
    end
  end

  
before_filter :require_login, except: [:new, :create]
  def destroy
    logout
    redirect_to(:authors, notice: 'Logged out!')
  end
end
