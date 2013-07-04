module Api
  module V1
    class PhotosController < ApplicationController
      class Photo < ::Photo
        def as_json(options={})
          h = super(options)
          h = {
              'id'          => id,
              'title'       => title,
              'group'       => group.title,
              'description' => description,
              'img'         => pic_url
          }
        end
      end

      respond_to :json

      def index
        respond_with Photo.all
      end

      def show
        respond_with Photo.find(params[:id])
      end

      def create
        respond_with Photo.create(params[:photo])
      end

      def update
        respond_with Photo.update(params[:id], params[:photo])
      end

      def destroy
        respond_with Photo.destroy(params[:id])
      end
    end
  end
end