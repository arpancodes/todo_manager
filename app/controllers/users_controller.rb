class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

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
    user = User.new(
      name: name,
      email: email,
      password: password,
    )
    if user.save
      session[:current_user_id] = user.id
      redirect_to todos_path
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
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
