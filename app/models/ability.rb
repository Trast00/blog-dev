class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, :all

    can :destroy, Post, author_id: user.id
    can :destroy, Comment, author_id: user.id

    return unless user.is? :admin

    can :destroy, :all
  end
end
