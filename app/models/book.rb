class Book < ActiveRecord::Base
  has_many :checkouts
  has_many :categorizations

  validates :title, presence: true
  validates :author, presence: true
  # validates :rating, inclusion: { in: [1..100] }
end
