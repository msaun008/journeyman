require 'rails_helper'

RSpec.describe Season, type: :model do

  subject {
    build(:season)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
