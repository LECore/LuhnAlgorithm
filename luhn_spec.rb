# frozen_string_literal: true

require './luhn.rb'

RSpec.describe 'verify_card_valid' do
  describe '.valid?' do
    it 'returns true for valid card' do
      expect(verify_card_valid('4561261212345467')).to be_truthy
    end

    it 'returns false for invalid card' do
      expect(verify_card_valid('4561261212345464')).to be_falsey
    end

    it 'returns true for valid card with spaces' do
      expect(verify_card_valid'4561 2612 1234 5467').to be_truthy
    end
  end
end