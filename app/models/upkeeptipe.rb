class Upkeeptipe < ApplicationRecord
    has_many :upkeeps, dependent: :destroy

    # validaciones y nombre unico
   validates :name, presence: true, uniqueness: {scope: :name}
end
