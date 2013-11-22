class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # attr_accessible :title, :body
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  validates :username, presence: true

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
