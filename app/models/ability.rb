class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.mod?
      can [:read, :update], :all
    else
      can :read, :all
    end
  end
end
