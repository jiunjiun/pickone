class Event < ApplicationRecord
  belongs_to :user
  has_many :items, inverse_of: :event, dependent: :destroy
  has_many :votes, through: :items
  has_many :event_voted

  accepts_nested_attributes_for :items, allow_destroy: true

  validates_presence_of :title
  validates_uniqueness_of :code

  validate :validate_items

  before_create :generate_code

  def top_item
    vote_sort.keys.first
  end

  def vote_sort
    votes.group(:item_id).order('count_id desc').count(:id)
  end

  def voted(user, params)
    result = {success: false}

    user_id = user.present? ? user.id : 0
    event_voted = self.event_voted.create(user_id: user_id)
    result[:message] = I18n.t('errors.votes.event_voted') if event_voted

    if is_multi_select
      _items = params[:items]

      _items.keys.each do |_item|
        item = items.find(_item)
        item.votes.create!(user_id: user_id)
      end
    else
      _item = params[:item]

      item  = items.find(_item)
      item.votes.create!(user_id: user_id)
    end

    result
  end

  private
  def validate_items
    errors.add(:items, I18n.t('activerecord.errors.models.event.attributes.items.blank')) if items.size < 2
  end

  def generate_code
    self.code = SecureRandom.hex(4)
  end
end
