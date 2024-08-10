# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  before_action :set_chat, only: [:create, :index]

  def create
    message_number = REDIS.incr("message_number:#{params[:application_token]}:#{params[:chat_id]}")

    # Enqueue job to create message in the background
    MessageJob.perform_later(params[:application_token], @chat.number, message_number, message_params)

    render json: { message_number: message_number }, status: :accepted
  end

  def index
    messages = @chat.messages
    render json: messages
  end

  def search
    results = Message.search(params[:query])
    render json: results
  end

  private

  def set_chat
    @chat = Chat.find_by!(number: params[:chat_id], application: Application.find_by!(token: params[:application_token]))
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
