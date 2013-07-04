module Api
  module V1
    class PhotosGroupsController < ApplicationController
      class PhotosGroup < ::PhotosGroup
        def as_json(options={})
          h = super(options)
          h = {
              'id'          => id,
              'title'       => title,
              'parent'      => parent.nil? ? nil : parent.title,
              'user'        => admin_users.email,
              'img'         => pic_url
          }
        end
      end

      respond_to :json

      def index
        respond_with PhotosGroup.all
      end

      def show
        respond_with PhotosGroup.find(params[:id])
      end

      def create
        respond_with PhotosGroup.create(params[:photo])
      end

      def update
        respond_with PhotosGroup.update(params[:id], params[:photo])
      end

      def destroy
        respond_with PhotosGroup.destroy(params[:id])
      end
    end
  end
end