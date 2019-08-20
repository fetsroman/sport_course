class Rate < ApplicationRecord
  belongs_to :course

  enum tariff: [:standart, :advanced, :vip]

  translates :title, :description, :tariff, :price


  validates_presence_of :title, :description, :tariff, :price
end
