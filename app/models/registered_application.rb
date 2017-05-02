class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  has_many :events

  before_save { self.url = url.downcase if url.present? }

  validates :user_id, presence: true
  validates :name, presence: true
  validates :url, presence: true, length: { minimum: 1 }
end
