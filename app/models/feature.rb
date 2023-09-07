class Feature < ApplicationRecord
    has_many :engines, dependent: :destroy

    # validaciones y nombre unico
  validates :name, presence: true, uniqueness: {scope: :name}
end
