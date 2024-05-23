require 'rails_helper'

RSpec.describe Chord, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :feeling }
    it { should validate_presence_of :notes }
    it { should validate_presence_of :relationship }
  end

  describe 'relationships' do
    it { should belong_to :song }
  end
end
