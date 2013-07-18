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
    end
  end
end