class Cab < ApplicationRecord
  validates :make,
            presence: true
  validates :model,
            presence: true
  validates :serial_no,
            presence: true,
            uniqueness: { scope: :make }
  validates :fleet_no,
            presence: true,
            uniqueness: { scope: :shop }

  belongs_to :shop
  has_many :stocked_items, as: :stockable
end
