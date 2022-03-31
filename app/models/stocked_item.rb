class StockedItem < ApplicationRecord
  belongs_to :inventory_item
  belongs_to :stockable, polymorphic: true
end