class ProjectPolicy #< Struct.new(:user, :project)
  attr_accessor :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def create?
    user.admin?  if user.present?
  end

  def update?
    project.authored_by?(user) || user.editor? if user.present?
  end
  alias_method :destroy?, :update?

  def publish?
    @user.role == "editor"
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
        puts "@@@@@Resolve ELSE"
        scope.where(published: true)
      end
    end
  end

end