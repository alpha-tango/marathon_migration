class Book < ActiveRecord::Base

  validates :title, presence: true
  validates :author, presence: true
  # validates :rating, inclusion: { in: [1..100] }
end
