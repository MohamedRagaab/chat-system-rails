module Api
  module V1
    class ChatsController < ApplicationController
      include ResponseFormatting

      before_action :set_application, only: [:create, :index]

      def create
        begin
          result = ChatService.create_chat(params[:application_token])
          render_success(message: "Chat creation initiated", data: result)
        rescue StandardError => e
          render_error(message: e.message)
        end
      end

      def index
        begin
          chats = ChatService.list_chats(params[:application_token])
          render_success(message: "Chats retrieved successfully", data: chats)
        rescue StandardError => e
          render_error(message: e.message)
        end
      end

      private

      def set_application
        @application = Application.find_by!(token: params[:application_token])
      end
    end
  end
end
