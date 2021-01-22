class UsersController < ApplicationController

  def new
    render "new"
  end

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
    redirect_to "/"
  end

  def show
    id = params[:id]
    user = User.find(id)
    to_render = "#{user.display_user}<p><a href=\"/users\">All Users</a></p>"
    render html: to_render.html_safe
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email, password: password)
    to_render = not(user == nil)
    render plain: to_render.to_s
  end
end
