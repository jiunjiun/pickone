class Item < ApplicationRecord
  belongs_to :event
  has_many :votes

  validates_presence_of :name
end
