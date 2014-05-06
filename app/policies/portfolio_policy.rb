class PortfolioPolicy < ApplicationPolicy
  attr_reader :user, :userInstance
  #<%if policy(comment).update? %>

  def initialize(user, userInstance)
    @user = user
    @userInstance = userInstance
  end

  def index?
    user.admin? if user
  end
  def update?
    puts "@@@@@@@@@@Portfolio Update: User Admin? #{user.admin?}"
    user.admin? if user
  end
  def create?
    puts "@@@@@@@@@@Portfolio Create: User Admin? #{user.admin?}"
    user.admin? if user
  end
  
  def show?
    true
  end
  

  Scope = Struct.new(:user, :scope) do
    def resolve
      scope.all
    end
  end
end