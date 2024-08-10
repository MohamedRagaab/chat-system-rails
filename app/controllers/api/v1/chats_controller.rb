module Api
  module V1
    class ChatsController < ApplicationController
      before_action :set_application, only: [:create, :index]

      def create
        chat_number = REDIS.incr("chat_number:#{params[:application_token]}")

        # Enqueue job to create chat in the background
        ChatJob.perform_later(params[:application_token], chat_number, chat_params)

        render json: { chat_number: chat_number }, status: :accepted
      end

      def index
        chats = @application.chats
        render json: chats
      end

      private

      def set_application
        @application = Application.find_by!(token: params[:application_token])
      end

      def chat_params
        params.require(:chat).permit(:name)
      end
    end
  end
end
