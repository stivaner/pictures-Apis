require "spec_helper"

describe PhotosGroup do
  before(:each) do
    @group = PhotosGroup.new
  end

  it "should be valid" do
    @group.should be_valid
  end
end
