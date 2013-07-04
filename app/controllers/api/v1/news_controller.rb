module Api
  module V1
    class NewsController < ApplicationController
      class News < ::News
        def as_json(options={})
          h = super(options)
          h = {
              'id'          => id,
              'title'       => title,
              'announce'    => announce,
              'body'        => body,
              'date_public' => date_publication,
              'is_public'   => publication,
              'hard_title'  => hard_title,
              'link'        => link
          }
        end
      end

      respond_to :json

      def index
        respond_with News.all
      end

      def show
        respond_with News.find(params[:id])
      end

      def create
        respond_with News.create(params[:news])
      end

      def update
        respond_with News.update(params[:id], params[:news])
      end

      def destroy
        respond_with News.destroy(params[:id])
      end
    end
  end
end