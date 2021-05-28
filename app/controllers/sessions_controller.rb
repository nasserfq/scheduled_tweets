class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully تم تسجيل الدخول بنجاح"
    else
      flash[:alert] = "Invalid email or password الايميل أو كلمة المرور خاطئة"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out سجلت خروج"
  end

  def edit
  end
end
