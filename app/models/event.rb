class Event < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  default_scope -> { order('created_at DESC') }
  validates :desc, presence: true, length: { maximum: 1000 }
  validates :user_id, presence: true

  def self.upcoming(after = DateTime.now, limit = 100)
    @upcoming_events = where('created_at > ?', after)

  end

end
