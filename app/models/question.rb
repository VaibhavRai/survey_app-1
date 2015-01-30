class Question < ActiveRecord::Base
  has_many :options
  belongs_to :survey

  accepts_nested_attributes_for :options

#  validates :description, presence: true
end
