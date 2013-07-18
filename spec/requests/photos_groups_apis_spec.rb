require 'spec_helper'

describe "PhotosGroupsApis" do
  before do
    @group = FactoryGirl.create(:photos_group)
  end

  describe "GET /api/v1/photos_groups" do
    before do
      get "/api/v1//photos_groups", :format => :json
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
      response.body.should include(@group.id.to_s)
      response.body.should include('Test photos groups')
    end
  end

  describe "#show" do

    before do
      get "/api/v1//photos_groups", id: @group.id, :format => :json
    end

    it "should retrieve status code of 200" do
      response.response_code.should == 200
    end

    it "should retrieve a content-type of json" do
      response.header['Content-Type'].should include 'application/json'
    end

    it "should retrieve a single player" do
      response.body.should include(@group.id.to_s)
      response.body.should include('Test photos groups')
    end
  end
end
