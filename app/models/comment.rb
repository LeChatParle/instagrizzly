class Comment < ApplicationRecord
  belongs_to :pic

  validates :name, presence: true
  validates :body, presence: true
end
