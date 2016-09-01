class BusinessType < ApplicationRecord
  has_many :business_roles, dependent: :destroy
  validates :name, presence: true, length: {maximum: 50},
    uniqueness: {case_sensitive: false}
end
