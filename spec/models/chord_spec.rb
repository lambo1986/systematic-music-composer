require 'rails_helper'

RSpec.describe Chord, type: :model do
  xdescribe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :feeling }
    it { should validate_presence_of :notes }
    it { should validate_presence_of :relationship }
  end
end
