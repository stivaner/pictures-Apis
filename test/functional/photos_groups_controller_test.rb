require 'test_helper'

class PhotosGroupsControllerTest < ActionController::TestCase
  setup do
    @photos_group = photos_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photos_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photos_group" do
    assert_difference('PhotosGroup.count') do
      post :create, photos_group: { orderby: @photos_group.orderby, parent_id: @photos_group.parent_id, pic: @photos_group.pic, title: @photos_group.title }
    end

    assert_redirected_to photos_group_path(assigns(:photos_group))
  end

  test "should show photos_group" do
    get :show, id: @photos_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photos_group
    assert_response :success
  end

  test "should update photos_group" do
    put :update, id: @photos_group, photos_group: { orderby: @photos_group.orderby, parent_id: @photos_group.parent_id, pic: @photos_group.pic, title: @photos_group.title }
    assert_redirected_to photos_group_path(assigns(:photos_group))
  end

  test "should destroy photos_group" do
    assert_difference('PhotosGroup.count', -1) do
      delete :destroy, id: @photos_group
    end

    assert_redirected_to photos_groups_path
  end
end
