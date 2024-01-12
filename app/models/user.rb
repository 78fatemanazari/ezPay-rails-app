class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups, foreign_key: 'author_id'
  has_many :entities, foreign_key: 'author_id'

  has_one_attached :avatar  # Assuming you want each user to have one avatar

  validates :name, presence: true
end