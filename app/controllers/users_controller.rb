class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show]

  def index
    # @users = User.all # use gem will_paginate instead
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "You have signed up as #{@user.username}"
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'Successfully updated your account'
      redirect_to user_path(@user) #articles_path
    else
      render :edit
    end
  end

  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 2)
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end