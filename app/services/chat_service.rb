class ChatService
  def self.create_chat(application_token)
    application = Application.find_by!(token: application_token)

    chat_number = REDIS.incr("chat_number:#{application_token}")

    ChatJob.perform_async(application_token, chat_number)

    { chat_number: chat_number }
  end

  def self.list_chats(application_token)
    application = Application.find_by!(token: application_token)
    application.chats
  end
end
