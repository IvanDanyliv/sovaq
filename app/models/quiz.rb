class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy

  validates :name, presence: true

  accepts_nested_attributes_for :questions
end
