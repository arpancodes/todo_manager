class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: "Hello user!"
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    user = User.create!(
      name: name,
      email: email,
      password: password,
    )
    render html: "<h1>Hey #{user.name}, Welcome to Todo management!</h1>".html_safe
  end
end
