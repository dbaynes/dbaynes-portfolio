class Ability
  include CanCan::Ability
  

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new(:role=>"guest")  #guest user
    Rails.logger.info("@@@@@User Role in Ability: #{user.role}")
    if user.role == 'admin'
      Rails.logger.info("@@@@@User Role in Ability is Admin: #{user.role}")
      can :read, :all
      can :create, Project
      can :update, Project
      can :destroy, Project
      can :create, Post
      #can :delete, Post
      #can :update, Post
      can :update, User
    elsif 
      user.role == 'editor'
        Rails.logger.info("@@@@@User Role in Ability is Editor: #{user.role}")
        can :read, :all
        can :create, Post 
        can :update, Post
        can :destroy, Post
        can :update, Project 
     elsif user.role == 'user'
        Rails.logger.info("@@@@@User Role in Ability is User: #{user.role}")
        can :read, :all
        can :read, Project
        can :read, Post
        can :create, Post 
        can :create, Comment 
    end 
    
       #user ||= User.new # guest user (not logged in)
       #if user.admin?
       #  can :manage, :all
       #else
       #  can :read, :all
         #can :update, Article, :published => true
       #end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
