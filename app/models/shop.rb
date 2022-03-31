class Shop < ApplicationRecord

  validates :name,
            presence: true,
            uniqueness: { case_sensitive: true }
  validates :code_name,
            presence: true,
            length: { minimum: 2, maximum: 5 },
            uniqueness: { case_sensitive: true }
  validates :domain,
            presence: true,
            uniqueness: { case_sensitive: true }
end
