# frozen_string_literal: true

# Controller deals with Organisation and Player relationship actions
class OrganisationPlayersController < ApplicationController
  load_and_authorize_resource

  def new
  end

  def create
    organisation_player = current_user.organisation_players.new(create_params)
    if organisation_player.save
      redirect_to user_path(organisation_player.player_id)
    else
      flash[:error] = organisation_player.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
  end

  def update
    organisation_player = OrganisationPlayer.find_by_id(params[:id])
    if organisation_player.update(update_params)
      redirect_to user_path(organisation_player.player)
    else
      flash[:error] = organisation_player.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @organisation_player.destroy
    flash[:notice] = 'Player Removed Successfully.'
    redirect_to organisation_players_path
  end

  def index
    @organisation_players = current_user.organisation_players
  end

  private

  def create_params
    params.require(:organisation_player).permit(:player_id, :salary)
  end

  def update_params
    params.require(:organisation_player).permit(:salary)
  end
end
