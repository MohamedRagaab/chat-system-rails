module Api
  module V1
    class ApplicationsController < ApplicationController
      def create
        application = Application.create!(application_params)
        render json: application, status: :created
      end

      def show
        application = Application.find_by!(token: params[:token])
        render json: application
      end

      private

      def application_params
        params.require(:application).permit(:name)
      end
    end
  end
end
