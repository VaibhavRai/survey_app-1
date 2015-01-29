class Survey < ActiveRecord::Base
  TYPES = ["Employee", "Event"]

  has_many :questions

  validates :name, presence: true
end
