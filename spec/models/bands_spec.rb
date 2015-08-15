require 'rails_helper'

describe Bands do
  let(:bands){FactoryGirl.create(:bands)}
  before (:each) do
    bands = build(:bands)
  end
  describe 'initialization' do
    it "it valid with default attributes" do
      expect(bands).to be_valid
    end

    it "saves with default attributes" do
      expect{bands.save!}.to_not raise_error
    end

    it "has a response in json"

    it "converts json into hash"
  end

  describe "#events" do
    it "returns array of Events"

    it "grabs all events from response"
   end

end