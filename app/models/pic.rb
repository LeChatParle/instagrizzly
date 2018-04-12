class Pic < ApplicationRecord
  #This creates the relationship between posts and comments
  #dependent/destroy force deletion of comments on deletion of post
  has_many :comments, dependent: :destroy

  #verifies that a title & description exist
  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
