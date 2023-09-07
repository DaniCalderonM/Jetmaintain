class Material < ApplicationRecord
    has_and_belongs_to_many :upkeeps

    # validaciones y nombre unico
  validates :name, presence: true, uniqueness: {scope: :name}
end
