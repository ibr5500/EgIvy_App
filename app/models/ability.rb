class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can %i[read], :all
    can %i[manage], :all, user:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
  end
end
