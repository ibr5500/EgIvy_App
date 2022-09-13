class Entity < ApplicationRecord
  belongs_to :users, foreign_key: 'user_id'

  has_many :entities_groups, dependent: :destroy
  has_many :groups, through: :entities_groups, dependent: :destroy

  validates :name, presence: true
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
