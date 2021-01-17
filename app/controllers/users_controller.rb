class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    users_list = User.all.map { |user| user.display_users_list }.join("")
    to_render = "<h2>List of users on our platform!</h2><ol>#{users_list}</ol>"
    render html: to_render.html_safe
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

  def show
    id = params[:id]
    user = User.find(id)
    render html: user.display_user.html_safe
  end
end
