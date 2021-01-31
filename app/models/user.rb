class User < ActiveRecord::Base
  has_secure_password
  has_many :todos
  validates :name, presence: true
  validates :name, length: { minimum: 2 }
  validates :email, presence: true

  def display_users_list
    "<li><a href=\"/users/#{id}\">#{name} - #{email}</a></li>"
  end

  def display_user
    "<h2>Details about #{name}:</h2><ul><li>Name: #{name}</li><li>Email: #{email}</li></ul>"
  end
end
