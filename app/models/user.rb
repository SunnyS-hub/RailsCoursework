class User < ApplicationRecord
  after_initialize :set_default
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable
  #user has many books in their collection
  has_many :books

  #Only make the first user admin
    #otherwise use default value (admin = false)
  def set_default
    if User.count == 0
      self.admin = true
    end
  end

end
