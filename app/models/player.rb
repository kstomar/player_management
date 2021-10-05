# frozen_string_literal: true

# This model is a role of user
class Player < User
  searchkick match: :text_middle
  has_many :organisation_players, dependent: :destroy
  has_many :organisations, through: :organisation_players
  
  def search_data
    {
      name: name,
      email: email
    }
  end
end
