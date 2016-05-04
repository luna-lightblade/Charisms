class Like < ActiveRecord::Base
  belongs_to :quote
  belongs_to :user

  validates_uniqueness_of :user_id, :scope => :quote_id
end
