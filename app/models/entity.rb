class Entity < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  has_and_belongs_to_many :groups, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
