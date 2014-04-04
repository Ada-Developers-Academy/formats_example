require 'spec_helper'

describe SinglesController do

  context "when accessing :show" do
    let!(:first_single){ Single.new(title: 'Hotel California',
                                    artist: 'I hate the Eagles, man')}

    it "should transform the object into JSON" do
      Single.should_receive(:find).and_return(first_single)

      get :show, id: 1, # this is a fake ID, since we don't need a valid one
                 format: :json

      parsed_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(parsed_response.class).to eq(Hash)
      expect(parsed_response[:id]).to be_nil
    end
  end


  context "when accessing :index" do

    let!(:first_single){ Single.new(title:  'Hotel California',
                                    artist: 'I hate the Eagles, man')}

    before(:each) do
      Single.should_receive(:all).and_return([first_single])
    end

    it "should succeed when accessing with json" do
      get :index, format: :json

      expect(response).to be_success
    end


    it "should succeed" do
      get :index

      expect(response).to be_success
    end


    it "should return 400 when accessing with xml" do
      get :index, format: :xml

      expect(response).not_to be_success
      expect(response.status).to eq(400)
    end
  end
end
