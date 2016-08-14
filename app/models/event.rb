class Event < ApplicationRecord
  belongs_to :user
  has_many :items, inverse_of: :event, dependent: :destroy

  accepts_nested_attributes_for :items, allow_destroy: true

  validates_presence_of :title

  validate :validate_items

  def validate_items
    errors.add(:items, I18n.t('activerecord.errors.models.event.attributes.items.blank')) if items.size < 2
  end
end
