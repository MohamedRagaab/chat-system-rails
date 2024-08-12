class Message < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :chat
  validates :number, uniqueness: { scope: :chat_id }

  def self.search(query)
    __elasticsearch__.search(query)
  end
end
