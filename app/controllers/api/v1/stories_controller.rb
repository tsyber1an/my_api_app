module Api
  module V1
    class StoriesController < ApplicationController
      def index
        stories = Story.where(epic_id: params[:epic_id])

        render json: stories
      end

      def create

      end
    end
  end
end
