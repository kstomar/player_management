# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    global_permissions(user)
    player_permissions(user) if user.player?
    organisation_permissions(user) if user.organisation?
  end

  def player_permissions(user)
    #Use this method when we write code for player permission
  end

  def organisation_permissions(user)
    can :all_players_listing, User
    can :manage, OrganisationPlayer, organisation: user
  end

  def global_permissions(user)
    can :edit, User, id: user.id
    can :read, User
  end
end
