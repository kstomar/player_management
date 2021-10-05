# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrganisationPlayersController do
  sign_in_user
  let(:player_user) { create :user, type: "Player" }
  let!(:organisation_player) { create :organisation_player, organisation_id:  subject.current_user.id, player_id: player_user.id}

  describe "Post 'create'" do
    it 'add player to Organisation' do
      organisation_player_params = attributes_for(:organisation_player, player_id: player_user.id)
      expect do
        post :create, params: { organisation_player: organisation_player_params }
      end.to change { OrganisationPlayer.count }
      expect(response).to redirect_to user_path(player_user.id)
    end

    it 'it should not add player if salary is blank ' do
      organisation_player_params = attributes_for(:organisation_player, salary: nil)
      expect do
        post :create, params: { organisation_player: organisation_player_params }
      end.to_not change(User, :count)
      expect(response.status).to eq(200)
    end
  end

  describe 'PATCH #update' do
    it 'updates the salary and redirects' do
      patch :update, params: { id: organisation_player.id, organisation_player: { salary: '40000' } }
      expect(response).to redirect_to user_path(organisation_player.player_id)
    end
  end

  describe 'DELETE #destroy' do
    it 'remove player from organisation' do
      expect do
        delete :destroy, params: { id: organisation_player.id }
      end.to change(OrganisationPlayer, :count).by(-1)
    end
  end
end
