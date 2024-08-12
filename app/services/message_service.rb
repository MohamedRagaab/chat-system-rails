class MessageService
  def self.create_message(application_token, chat_number, message_params)
    message_number = REDIS.incr("message_number:#{application_token}:#{chat_number}")

    MessageJob.perform_async(application_token, chat_number, message_number, message_params[:body], 'create')

    { message_number: message_number }
  end

  def self.list_messages(chat_number)
    Chat.find_by!(number: chat_number).messages
  end

  def self.search_messages(query, chat_id)
    elasticsearch_query = {
      query: {
        bool: {
          must: [
            { match: { chat_id: chat_id } },
            { query_string: { query: "*#{query}*", fields: ['body'] } }
          ]
        }
      }
    }

    Message.search(elasticsearch_query)
  end

  def self.update_message(application_token, chat_number, message_number, message_params)
    MessageJob.perform_async(application_token, chat_number, message_number, message_params[:body], 'update')
  end

  def self.find_message(chat_number, message_number)
    Chat.find_by!(number: chat_number).messages.find_by!(number: message_number)
  end
end
