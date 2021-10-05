# frozen_string_literal: true

class CreateTableOrganistaionPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :organisation_players do |t|
      t.integer :player_id
      t.integer :organisation_id
      t.decimal :salary
      t.timestamps
    end
  end
end
