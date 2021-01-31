class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render plain: "logged in!"
    else
      render plain: "wrong password"
    end
  end
end
