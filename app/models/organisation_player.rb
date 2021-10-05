# frozen_string_literal: true

# This is a middle model for player and organisation relationship
class OrganisationPlayer < ApplicationRecord
  belongs_to :player
  belongs_to :organisation

  delegate :name, to: :player, prefix: true
  delegate :email, to: :player, prefix: true

  validates :salary, presence: true, numericality: true
end
