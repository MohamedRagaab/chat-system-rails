class Message < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :chat
  validates :number, uniqueness: { scope: :chat_id }

  # Searches for messages containing the given query string.
  # @param query [String] The search query string.
  # @return [Elasticsearch::Model::Response] The search results.
  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          query_string: {
            query: '*#{query}*',
            fields: ['body']
          }
        }
      }
    )
  end

  # Converts the object to a JSON representation for indexing.
  # @param options [Hash] Additional options for the JSON representation.
  # @return [Hash] The JSON representation of the object.
  def as_indexed_json(options = {})
    as_json(only: [:body])
  end
end
