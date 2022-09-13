class Group < ApplicationRecord
  belongs_to :users, foreign_key: 'user_id'

  has_many :entities_groups, dependent: :destroy
  has_many :entities, through: :entities_groups, dependent: :destroy

  validates :name, :icon, presence: true
end
