class Entity < ApplicationRecord
  belongs_to :users

  has_and_belongs_to_many :groups

  validates :name, :amount, presence: true
end
