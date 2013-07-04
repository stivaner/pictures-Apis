require 'spec_helper'

describe "NewsApis" do
  before do
    @news_item = FactoryGirl.create(:news_item)
  end

  describe "GET /api/v1/news" do
    before do
      get "/api/v1//news", :format => :json
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
      response.body.should include(@news_item.id.to_s)
      response.body.should include('Test news')
    end
  end

  describe "#show" do

    before do
      get "/api/v1//news", id: 1, :format => :json
    end

    it "should retrieve status code of 200" do
      response.response_code.should == 200
    end

    it "should retrieve a content-type of json" do
      response.header['Content-Type'].should include 'application/json'
    end

    it "should retrieve a single player" do
      response.body.should include(@news_item.id.to_s)
      response.body.should include('Test news')
    end
  end
end
