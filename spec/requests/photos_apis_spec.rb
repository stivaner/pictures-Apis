require 'spec_helper'

describe "PhotosApis" do
  before do
    @photo = FactoryGirl.create(:photo)
  end

  describe "GET /api/v1/photos" do
    before do
      get "/api/v1//photos", :format => :json
    end

    it "should retrieve status code of 200" do
      response.status.should be(200)
    end

    it "should retrieve a content-type of json" do
      response.header['Content-Type'].should include 'application/json'
    end

    it "should retrieve list of news" do
      #news_json = News.all.to_json
      #response.body.should eql(news_json)
      response.body.should include(@photo.id.to_s)
      response.body.should include('Test photo')
    end
  end

  describe "#show" do

    before do
      get "/api/v1//photos", id: @photo.id, :format => :json
    end

    it "should retrieve status code of 200" do
      response.response_code.should == 200
    end

    it "should retrieve a content-type of json" do
      response.header['Content-Type'].should include 'application/json'
    end

    it "should retrieve a single player" do
      response.body.should include(@photo.id.to_s)
      response.body.should include('Test photo')
    end
  end
end
