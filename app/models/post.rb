class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 140 }
  validates :body, presence: true

  belongs_to :admin
end
