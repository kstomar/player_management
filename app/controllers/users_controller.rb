# frozen_string_literal: true

# Controller deals with User Profile and Player searching
class UsersController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def all_players_listing
    @players = Player.search search_text.to_s, fields: %i[name email]
  end

  private
  
  def search_text
    params[:search].present? ? params[:search] : '*'
  end
end
