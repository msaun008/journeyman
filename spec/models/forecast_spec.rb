require 'rails_helper'

RSpec.describe Forecast, type: :model do

  subject {
    build(:forecast)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
end
