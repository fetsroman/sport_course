class Rate < ApplicationRecord
  belongs_to :course

  enum tariff: [:standart, :advanced, :vip]

  translates :title, :description, :price

  validates_presence_of :title, :description, :tariff, :price

  def increment_bought_count
    self.increment(:bought_count)
    save!
  end
end
