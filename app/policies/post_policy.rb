class PostPolicy #< Struct.new(:user, :post)
  attr_accessor :user, :post

  def initialize(user, post)
    @user = user
    puts "@@@@@@@user: #{user}"
    @post = post
  end
  def show?
    #user.admin? || user.editor? || user.member? || user.guest? if user.present?
    #if user.present?
    #  user.admin?
    #  user.editor?
    #  user.member?
    # else
      true
    #end
  end

  def create?
    user.author? || user.editor? if user.present?
  end

  def update?
    post.authored_by?(user) || user.editor? if user.present?
  end
  alias_method :destroy?, :update?

  def publish?
    @user.role == "editor" if user.present?
  end
  Scope = Struct.new(:user, :scope) do
    def resolve
      #puts "@@@@@@@RESOLVE! User role: #{user.role} and ? #{user.member?} User ID: #{user.id}"
      if user.present? && user.editor? 
        scope.all
      elsif user.present? && user.author? 
        scope.where(author_id: user.id) | scope.published
      elsif user.present? && user.member? 
        puts "@@@@@@MEMBER IN RESOLVE:"
        scope.where(author_id: user.id) #| scope.all
      else
        puts "@@@@@Resolve ELSE in Post Policy"
        scope.where(published: true)
      end
    end
  end

end