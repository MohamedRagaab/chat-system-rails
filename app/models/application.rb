class Application < ApplicationRecord
  has_many :chats, dependent: :destroy
  validates :token, presence: true, uniqueness: true
end
