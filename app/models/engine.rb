class Engine < ApplicationRecord
  belongs_to :feature
  has_one_attached :image
  has_many :upkeeps, dependent: :destroy

  # validates :nombremotor_unico y validaciones
  validates :description, presence: true
  validates :name, presence: true , uniqueness: {scope: :name}
  validates :feature_id, presence: true

end
