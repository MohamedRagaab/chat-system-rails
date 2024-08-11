module Api
  module V1
    class ApplicationsController < ApplicationController
      include ResponseFormatting

      def create
        begin
          application = ApplicationService.create_application(application_params)
          render_success(message: "App created successfully", data: application)
        rescue StandardError => e
          render_error(message: e.message)
        end
      end

      def show
        begin
          application = ApplicationService.show_application(params[:token])
          render_success(message: "App retrieved successfully", data: application)
        rescue StandardError => e
          render_error(message: e.message)
        end
      end

      def update
        begin
          application = ApplicationService.update_application(params[:token], application_params)
          render_success(message: "App updated successfully", data: application)
        rescue StandardError => e
          render_error(message: e.message)
        end
      end

      private

      def application_params
        params.require(:application).permit(:name)
      end
    end
  end
end
