class MessageCountUpdater
  include Sidekiq::Job

  def perform
    Chat.find_each do |chat|
      messages_count = chat.messages.count
      chat.update(messages_count: messages_count)
    end
  end
end
