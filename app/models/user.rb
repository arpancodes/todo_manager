class User < ActiveRecord::Base
  def display_user
    "<li>#{name} - #{email}</li>"
  end
end
