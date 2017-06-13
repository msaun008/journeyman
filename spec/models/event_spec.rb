require 'rails_helper'

RSpec.describe Event, type: :model do

  subject {
    build(:event)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a start date" do
    subject.start_date = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a duration" do
    subject.duration = nil
    expect(subject).to_not be_valid
  end
end
