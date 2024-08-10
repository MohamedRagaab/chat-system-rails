# app/jobs/message_job.rb
class MessageJob
  include Sidekiq::Job

  def perform(application_token, chat_number, message_number, message_params)
    # Find the application by token
    application = Application.find_by!(token: application_token)

    # Find the chat within the application
    chat = application.chats.find_by!(number: chat_number)

    # Create the message in the database
    chat.messages.create!(message_params.merge(number: message_number))
  end
end
