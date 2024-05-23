require 'rails_helper'

RSpec.describe Instrument, type: :model do
  xdescribe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :type }
  end
end
