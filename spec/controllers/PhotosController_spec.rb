require "spec_helper"

describe Admin::PhotosController do

  describe "GET index" do
    login_user

    it "assigns all photos as @users (admin)" do
      get 'index'
      response.status.should be(200)
    end
  end

  describe "Create new Photos item" do
    login_user
    it "should redirect to index with a notice on successful save" do
      Photo.any_instance.stubs(:valid?).returns(true)
      post 'create'
      assigns[:photo].should_not be_new_record
      flash[:notice].should_not be_nil
      response.should redirect_to(admin_photo_path(assigns[:photo]))
    end

    it "should re-render new template on failed save" do
      Photo.any_instance.stubs(:valid?).returns(false)
      post 'create'
      assigns[:photo].should be_new_record
      #flash[:notice].should be_nil
      #response.should render_template('index')
    end

    it "should pass params to photos item" do
      post 'create', :photo => { :title => 'Plain' }
      assigns[:photo].title.should == 'Plain'
    end
  end
end