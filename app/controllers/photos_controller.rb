class PhotosController < ApplicationController
  respond_to :json

  before_filter :fetch_photo, :except => [:index, :create]

  def fetch_photo
    @photo = Photo.find_by_id(params[:id])
  end

  def index
    @photos = Photo.all
    respond_with @photos
  end
end
