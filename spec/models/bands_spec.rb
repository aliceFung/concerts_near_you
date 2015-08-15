require 'rails_helper'

describe Bands do
  let(:bands){build(:bands)}

  it "it valid with default attributes" do
    expect(bands).to be_valid
  end

  it "saves with default attributes" do
    expect{bands.save!}.to_not rails_error
  end

  it "has a response in json" do

  end

  it "converts json into hash" do

  end

  describe "#events" do
    it "returns array of Events"

    it "grabs all events from response"
  end

end