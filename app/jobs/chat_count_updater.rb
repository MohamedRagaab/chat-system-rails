class ChatCountUpdater
  include Sidekiq::Job

  def perform
    Application.find_each do |application|
      chats_count = application.chats.count
      application.update(chats_count: chats_count)
    end
  end
end
