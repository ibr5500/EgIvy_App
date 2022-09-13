class Group < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  has_and_belongs_to_many :entities, dependent: :destroy

  validates :name, :icon, presence: true
end
