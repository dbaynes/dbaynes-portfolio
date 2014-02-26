class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #has_many :posts, foreign_key: "username"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ###has_secure_password
 
  #attr_accessible :email, :password, :password_confirmation
  
  validates_uniqueness_of :email

end
