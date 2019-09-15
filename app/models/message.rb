class Message < ApplicationRecord
  belongs_to :chat_id
  belongs_to :user_id
end
