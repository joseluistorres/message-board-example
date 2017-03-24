class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  validates_presence_of :title, :body

  scope :order_by_latest, -> { order(created_at: :desc) }
end
