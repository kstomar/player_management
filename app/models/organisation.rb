# frozen_string_literal: true

# This model is a role of user
class Organisation < User
  has_many :organisation_players, dependent: :destroy
  has_many :players, through: :organisation_players
end
