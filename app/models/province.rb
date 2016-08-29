class Province < ApplicationRecord
  belongs_to :country
  has_many :towns, dependent: :destroy
  has_many :places, through: :towns, dependent: :destroy
end
