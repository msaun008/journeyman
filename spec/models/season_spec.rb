require 'rails_helper'

RSpec.describe Season, type: :model do

  subject {
    described_class.new(
      name: 'Spring 2017'
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
end
