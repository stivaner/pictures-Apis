require "spec_helper"

describe News do
  let(:newsItem) { FactoryGirl.build(:news_item) }

  before(:each) do
    @news = News.new
  end

  it "should be valid" do
    @news.should be_valid
  end

  it "has none to begin with" do
    expect(News.count).to eq 0
  end

  it "has one after adding one" do
    News.create
    expect(News.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(News.count).to eq 0
  end
end
