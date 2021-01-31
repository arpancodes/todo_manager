class PagesController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def main
    if current_user
      redirect_to todos_path
    else
      render "index"
    end
  end
end
