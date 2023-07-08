class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities based on the user role
    if user.admin?
      can :manage, :all
    else
      can :read, Record
      can :create, Record, user_id: user.id
      can :update, Record, user_id: user.id
      can :destroy, Record, user_id: user.id
    end
  end
end
