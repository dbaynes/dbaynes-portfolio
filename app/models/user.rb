class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  #has_many :roles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #has_many :posts, foreign_key: "username"
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  ###has_many :posts, foreign_key: "admin_id"
  #has_many :projects       
  ###has_secure_password
 
  #attr_accessible :email, :password, :password_confirmation
  
  #validates_uniqueness_of :email
  
  #scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0"} }
  #
  def author?
 	  role == 'author'
  end  
  def admin?
 	  role == 'admin'
  end  
  def editor?
 	  role == 'editor'
  end  
  def member?
 	  role == 'member'
  end  
  def guest?
 	  role == 'guest'
  end  
  
  ROLES = %w[admin editor member guest]
  
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
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
    end
  end
  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end    
  end
  
  def password_required?
    super && provider.blank?
  end
    
  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end
