class RegisteredApplication < ActiveRecord::Base
  belongs_to :user

  # validates :user, presence: tue
  # validates :name, presence: true
  # validates :url, presence: trure
end
