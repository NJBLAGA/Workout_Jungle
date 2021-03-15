class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #A user can have many listings, if user is deleted, their listings are destroyed as well
  has_many :listings, dependent: :destroy
end
