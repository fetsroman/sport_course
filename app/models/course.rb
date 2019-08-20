class Course < ApplicationRecord
  has_many :lessons
  has_many :rates
  has_many :bought_lists

  translates :title, :description
  mount_uploader :document, DocumentUploader
  mount_uploader :trailer, TrailerUploader
  mount_uploader :image, ImageUploader

  validates_presence_of :title, :description, :image, :trailer, :document
end
