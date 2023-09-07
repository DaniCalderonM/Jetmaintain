class Upkeep < ApplicationRecord
  belongs_to :city
  belongs_to :upkeeptipe
  belongs_to :engine
  has_and_belongs_to_many :materials

   # validaciones
   validates :date, presence: true
   validates :email, presence: true
   validates :city_id, presence: true
   validates :upkeeptipe_id, presence: true
   validates :engine_id, presence: true

end
