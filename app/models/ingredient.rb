class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cockails, through: :doses
  validates :name, presence: true, uniqueness: true
end
