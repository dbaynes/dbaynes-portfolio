class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  #has_many :roles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #has_many :posts, foreign_key: "username"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #has_many :projects       
  ###has_secure_password
 
  #attr_accessible :email, :password, :password_confirmation
  
  validates_uniqueness_of :email
  
  #scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0"} }
  #
  ROLES = %w[admin editor guest]
  
  def roles=(roles)
     self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end
  
  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end
  
  def role?(role)
    #logger.info("@@@@@@#{User.with_role}")
    logger.info("@@@@@Email: #{email}")
    #role = "editor"
    logger.info("@@@@@Role: #{role}")
    logger.info("@@@@@CurrentUserRole: #{role}")
    logger.info("@@@@@ROLE: #{role}- role.to_s: #{role.to_s} ")
    logger.info("@@@@@Return: #{ROLES.include? role.to_s} #{role}")
    #roles.include? role.to_s
    
    ROLES.include? role.to_s
  end
  

end
