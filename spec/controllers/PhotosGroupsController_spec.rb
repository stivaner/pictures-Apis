require "spec_helper"

describe Admin::PhotosGroupsController do

  describe "GET index" do
    login_user

    it "assigns all photos froups as @users (admin)" do
      get 'index'
      response.status.should be(200)
    end
  end

  describe "Create new Photos Group item" do
    login_user
    it "should redirect to index with a notice on successful save" do
      PhotosGroup.any_instance.stubs(:valid?).returns(true)
      post 'create'
      assigns[:photos_group].should_not be_new_record
      flash[:notice].should_not be_nil
      response.should redirect_to(admin_photos_group_path(assigns[:photos_group]))
    end

    it "should re-render new template on failed save" do
      PhotosGroup.any_instance.stubs(:valid?).returns(false)
      post 'create'
      assigns[:photos_group].should be_new_record
      #flash[:notice].should be_nil
      #response.should render_template('index')
    end

    it "should pass params to photos groups item" do
      post 'create', :photos_group => { :title => 'Plain' }
      assigns[:photos_group].title.should == 'Plain'
    end
  end
end