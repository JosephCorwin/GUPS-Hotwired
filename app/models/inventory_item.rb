class InventoryItem < ApplicationRecord
  validates :name,
            presence: true,
            uniqueness: { scope: :mfg }
  validates :category,
            presence: true

  has_many :stocked_items
end