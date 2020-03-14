class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :quiz

  validates :question, presence: true

  accepts_nested_attributes_for :answers
end
