class UserPolicy < ApplicationPolicy
  attr_reader :user, :userInstance
  #<%if policy(comment).update? %>

  def initialize(user, userInstance)
    @user = user
    @userInstance = userInstance
  end

  def index?
    user.editor? if user
  end
  def update?
    puts "@@@@@@@@@@User Update: User Admin? #{user.admin?}"
    user.admin? if user
  end
  def create?
    puts "@@@@@@@@@@User Create: User admin? #{user.admin?}"
    user.admin? if user
  end
  

  Scope = Struct.new(:user, :scope) do
    def resolve
      scope.all
    end
  end
end