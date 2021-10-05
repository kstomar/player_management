# frozen_string_literal: true

FactoryBot.define do
  factory :organisation_player do
    player_id { 1 }
    organisation_id { 2 }
    salary { 15_000 }
  end
end
