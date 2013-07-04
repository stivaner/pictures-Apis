class PhotosGroupsController < ApplicationController
  respond_to :json

  before_filter :fetch_user, :except => [:index, :create]

  def fetch_user
    @group = PhotosGroup.find_by_id(params[:id])
  end

  def index
    @groups = PhotosGroup.all
    respond_with @groups
  end
end
