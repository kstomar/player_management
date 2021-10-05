# frozen_string_literal: true

module OrganisationsHelper

  def not_connected_player
    @players ||= Player.where.not(id: current_user.players)
  end
end
