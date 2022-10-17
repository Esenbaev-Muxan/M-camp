class Comment < ApplicationRecord
  belongs_to :message
  belongs_to :user
  validates :body, presence: true
end
