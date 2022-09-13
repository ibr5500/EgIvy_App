class Entity < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  #has_many :groups, through: :, dependent: :destroy
end
