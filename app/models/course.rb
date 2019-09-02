class Course < ApplicationRecord
  has_many :lessons
  has_many :rates
  has_many :bought_lists

  translates :title, :description
  mount_uploader :document, DocumentUploader
  mount_uploader :trailer, TrailerUploader
  mount_uploader :image, ImageUploader

  validates_presence_of :title, :description, :image, :trailer, :document

  scope :published, -> { where(published: true) }

  def bought?(user_id)
    BoughtList.find_by(course_id: self.id, user_id: user_id).present?
  end

  def bought_tariff
    rate_id = BoughtList.find_by_course_id(self.id).rate_id
    Rate.find_by_id(rate_id).tariff
  end

  def bought_tariff_title
    rate_id = BoughtList.find_by_course_id(self.id).rate_id
    Rate.find_by_id(rate_id).tariff
  end

  def watched_count
    WatchedList.where(course_id: self.id, watched: true).count
  end
end
