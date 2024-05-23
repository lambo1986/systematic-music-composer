require 'rails_helper'

RSpec.describe Instrument, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :type }
  end

  describe 'relationships' do
    it { should belong_to :song }
  end
end
