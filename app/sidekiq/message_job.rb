class MessageJob
  include Sidekiq::Job

  def perform(application_token, chat_number, message_number, message_body, operation_type)
    application = Application.find_by!(token: application_token)

    chat = application.chats.find_by!(number: chat_number)

    case operation_type
    when 'create'
      chat.messages.create!(number: message_number, body: message_body)
    when 'update'
      message = chat.messages.find_by!(number: message_number)

      message.update!(body: message_body)
    else
      raise ArgumentError, "Invalid operation type: #{operation_type}"
    end
  end
end
