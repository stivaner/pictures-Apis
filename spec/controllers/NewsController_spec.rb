require "spec_helper"

describe Admin::NewsController do

  describe "GET index" do
    login_user

    it "assigns all news as @users (admin)" do
      get 'index'
      response.status.should be(200)
    end
  end

  describe "Create new News item" do
    login_user
    it "should redirect to index with a notice on successful save" do
      News.any_instance.stubs(:valid?).returns(true)
      post 'create'
      assigns[:news].should_not be_new_record
      flash[:notice].should_not be_nil
      response.should redirect_to(admin_news_path(assigns[:news]))
    end

    it "should re-render new template on failed save" do
      News.any_instance.stubs(:valid?).returns(false)
      post 'create'
      assigns[:news].should be_new_record
      #flash[:notice].should be_nil
      #response.should render_template('index')
    end

    it "should pass params to news item" do
      post 'create', :news => { :title => 'Plain' }
      assigns[:news].title.should == 'Plain'
    end
  end
end