class Course < ApplicationRecord
  has_many :lessons
  has_many :rates
  mount_uploader :document, DocumentUploader
end
