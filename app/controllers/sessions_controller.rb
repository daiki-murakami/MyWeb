class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードに誤りがあります'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url, flash: {success: 'ログアウトしました'}
  end
end
