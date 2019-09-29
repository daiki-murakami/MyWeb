class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if false
      if @user.save
        redirect_to @user
      else
        render 'new'
      end
    else
      flash.now[:danger] = "現在新規ユーザーは作成できません"
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :password,
        :password_confirmation)
    end
end
