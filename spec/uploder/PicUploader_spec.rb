require 'spec_helper'
require 'carrierwave/test/matchers'

describe PicUploader do
  include CarrierWave::Test::Matchers

  before do
    @photo = FactoryGirl.create(:photo)
    PicUploader.enable_processing = true
    @uploader = PicUploader.new(@photo, :pic)
    @uploader.store!(File.open("#{Rails.root}/public/uploads/darth-vader.jpg"))
  end

  after do
    PicUploader.enable_processing = false
    @uploader.remove!
  end

  context 'the thumb version' do
    it "should scale down a landscape image to be exactly 64 by 64 pixels" do
      @uploader.thumb.should be_no_larger_than(100, 100)
    end
  end

  context 'the preview version' do
    it "should scale down a landscape image to fit within 200 by 200 pixels" do
      @uploader.preview.should be_no_larger_than(300, 300)
    end
  end

  it "should make the image readable only to the owner and not executable" do
    @uploader.should have_permissions(0600)
  end
end