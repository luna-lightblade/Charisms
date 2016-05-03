class Quote < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :quote, presence: true, length: { maximum: 140 }, uniqueness: true
  validates :context, length: { maximum: 250 }
  validates :sayer, presence: true, length: { maximum: 50 }
end
