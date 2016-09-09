class Vote < ApplicationRecord
  belongs_to :item
  belongs_to :user

  has_one :event, through: :item
end
