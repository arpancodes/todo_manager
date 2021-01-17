class User < ActiveRecord::Base
  def display_users_list
    "<li>#{name} - #{email}</li>"
  end

  def display_user
    "<h2>Details about #{name}:</h2><ul><li>Name: #{name}</li><li>Email: #{email}</li></ul>"
  end
end
