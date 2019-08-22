class Lesson < ApplicationRecord
  belongs_to :course
  has_many :watched_lists

  translates :title, :description
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader

  validates_presence_of :title, :description, :image, :video

  def next
    Lesson.where('id > ?', self.id).first
  end
end
