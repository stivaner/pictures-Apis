module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      if(!@user)
        @user = FactoryGirl.create(:user)
      end
      sign_in @user
    end
  end
end