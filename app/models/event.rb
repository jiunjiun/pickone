class Event < ApplicationRecord
  belongs_to :user
  has_many :items, inverse_of: :event, dependent: :destroy
  has_many :votes, through: :items

  accepts_nested_attributes_for :items, allow_destroy: true

  validates_presence_of :title
  validates_uniqueness_of :code

  validate :validate_items


  def top_item
    vote_sort.keys.first
  end

  def vote_sort
    votes.group(:item_id).order('count_id desc').count(:id)
  end

  private
  def validate_items
    errors.add(:items, I18n.t('activerecord.errors.models.event.attributes.items.blank')) if items.size < 2
  end
end
