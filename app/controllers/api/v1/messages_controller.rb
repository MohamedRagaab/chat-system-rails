module Api
  module V1
    class MessagesController < ApplicationController
      include ResponseFormatting

      before_action :set_chat, only: [:create, :index, :search, :update, :show]
      before_action :set_message, only: [:update, :show]

      def create
        begin
          result = MessageService.create_message(params[:application_token], @chat.number, message_params)
          render_success(message: "Message creation initiated", data: result)
        rescue StandardError => e
          render_error(message: e.message)
        end
      end

      def index
        begin
          messages = MessageService.list_messages(@chat.number)
          render_success(message: "Messages retrieved successfully", data: messages)
        rescue StandardError => e
          render_error(message: e.message)
        end
      end

      def search
        begin
          results = MessageService.search_messages(params[:query], @chat.id)
          render_success(message: "Search results", data: results)
        rescue StandardError => e
          render_error(message: e.message)
        end
      end

      def update
        begin
          result = MessageService.update_message(params[:application_token], @chat.number, @message.number, message_params)
          render_success(message: "Message update initiated", data: result)
        rescue StandardError => e
          render_error(message: e.message)
        end
      end

      def show
        begin
          message = MessageService.find_message(@chat.number, @message.number)
          render_success(message: "Message retrieved successfully", data: message)
        rescue StandardError => e
          render_error(message: e.message)
        end
      end

      private

      def set_chat
        @chat = Chat.find_by!(number: params[:chat_number], application: Application.find_by!(token: params[:application_token]))
      end

      def set_message
        @message = @chat.messages.find_by!(number: params[:number])
      end

      def message_params
        params.require(:message).permit(:body)
      end
    end
  end
end
