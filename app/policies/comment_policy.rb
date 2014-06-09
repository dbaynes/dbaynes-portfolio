class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment
  
  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def index?
    user.editor? if user
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
  
  def update?
    puts "@@@@@@@@@@Comments Update: User Editor? #{user.editor?}"
    user.editor? if user
  end

  Scope = Struct.new(:user, :scope) do
    def resolve
      if user.present? && user.editor? 
         scope.all
      end
    end
  end
end