class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :user
      can [:new, :create], Post
      can :manage, Post, user_id: user.id
      can :read, :all
    else
      can :read, :all
    end
  end
end
