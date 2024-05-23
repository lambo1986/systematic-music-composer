require 'rails_helper'

RSpec.describe Songs, type: :model do
  xdescribe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :genre }
    it { should validate_presence_of :vibe }
    it { should validate_presence_of :description }
    it { should validate_presence_of :tempo }
    it { should validate_presence_of :form }
    it { should validate_presence_of :lyrics }
    it { should validate_presence_of :instrumentation }
  end
end
