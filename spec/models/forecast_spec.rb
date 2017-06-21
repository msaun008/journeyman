require 'rails_helper'

RSpec.describe Forecast, type: :model do

  subject {
    build(:forecast)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is invalid without a season" do
    subject.season_id = nil
    expect(subject).to_not be_valid
  end

  it "is invalid without an event" do
    subject.event_id = nil
    expect(subject).to_not be_valid
  end
end
