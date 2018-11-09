class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum:1, maximum:50 }
  validates :body, presence: true, length: {minimum:1, maximum:800}
end