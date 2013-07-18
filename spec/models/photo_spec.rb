require "spec_helper"

describe Photo do
  before(:each) do
    @photo = Photo.new
  end

  it "should be valid" do
    @photo.should be_valid
  end

  it "has none to begin with" do
    expect(Photo.count).to eq 0
  end

  it "has one after adding one" do
    Photo.create
    expect(Photo.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(Photo.count).to eq 0
  end
end
