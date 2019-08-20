class Lesson < ApplicationRecord
  belongs_to :course

  translates :title, :description
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader

  validates_presence_of :title, :description, :image, :video
end
