class Pic < ApplicationRecord
  #This creates the relationship between posts and comments
  #dependent/destroy force deletion of comments on deletion of post
  has_many :comments, dependent: :destroy

  #verifies that a title & description exist
  validates :title, presence: true
  validates :description, presence: true
end
