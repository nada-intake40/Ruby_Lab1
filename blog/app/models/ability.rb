class Ability
  include CanCan::Ability

  def initialize(user)

    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    
    if user.present? 
       can :create, Comment
       
       can [:destroy , :update], Article do |article|
          article.user == user.id
      #  active: true, user_id: user.id
        end
      end
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
