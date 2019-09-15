class Vote < ApplicationRecord
  belongs_to :post_id
  belongs_to :user_id
end
