# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrganisationPlayer, type: :model do
  describe 'associations' do
    it { should belong_to(:player).class_name('Player') }
    it { should belong_to(:organisation).class_name('Organisation') }
  end

  describe 'validations' do
    it { should validate_presence_of(:salary) }
    it { should validate_numericality_of(:salary) }
  end
end
