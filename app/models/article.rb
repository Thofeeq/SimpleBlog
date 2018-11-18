class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum:1, maximum:50 }

  validates :body, presence: true, length: { minimum:1, maximum:2000 }

  validates :user_id , presence: true
end