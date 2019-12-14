class User < ApplicationRecord
  after_initialize :set_default
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable

  #Only make the first user admin
  def set_default
    if User.count == 0
      self.admin = true
    end
  end

end
