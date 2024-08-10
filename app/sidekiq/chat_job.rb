# app/jobs/chat_job.rb
class ChatJob
  include Sidekiq::Job

  def perform(application_token, chat_number, chat_params)
    # Find the application by token
    application = Application.find_by!(token: application_token)

    # Create the chat in the database
    chat = application.chats.create!(chat_params.merge(number: chat_number))
  end
end
