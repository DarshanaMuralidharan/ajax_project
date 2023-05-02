class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :manage, Review, user_id: user.id
    can :access, :movies
    can :create, Movie
    can :read, :all
    can :create, Review
    can :review_new, Review

    can :update, Review, user_id: user.id
    can :destroy, Review, user_id: user.id
  end
end
