class MessageService
  def self.create_message(application_token, chat_number, message_params)
    message_number = REDIS.incr("message_number:#{application_token}:#{chat_number}")

    MessageJob.perform_async(application_token, chat_number, message_number, message_params[:body], 'create')

    { message_number: message_number }
  end

  def self.list_messages(chat_number)
    Chat.find_by!(number: chat_number).messages
  end

  def self.search_messages(query)
    Message.search(query)
  end

  def self.update_message(application_token, chat_number, message_number, message_params)
    MessageJob.perform_async(application_token, chat_number, message_number, message_params[:body], 'update')
  end
end
