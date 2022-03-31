class Cab < ApplicationRecord
  belongs_to :shop

  validates_presence_of :make
  validates_presence_of :model
  validates_presence_of :serial_no
  validates_uniqueness_of :serial_no
  validates_presence_of :fleet_no
  validates_uniqueness_of :fleet_no
end
