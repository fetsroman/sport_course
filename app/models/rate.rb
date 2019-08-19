class Rate < ApplicationRecord
  belongs_to :course

  enum tariff: [:standart, :advanced, :vip]
end
