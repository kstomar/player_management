# frozen_string_literal: true

# This is User Model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def player?
    type == 'Player'
  end

  def organisation?
    type == 'Organisation'
  end

  def my_player?(player_id)
    players.ids.include? player_id
  end

  def get_salary(player_id)
    organisation_players.find_by(player_id: player_id).salary
  end
end
