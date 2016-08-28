# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text(65535)
#  starts      :datetime
#  ends        :datetime
#  photo_url   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ActiveRecord::Base
  before_save :populate_blank_starts

  validates :name, presence: true
  validate :starts_before_ends

  scope :active, -> { where('starts > ?', Time.zone.now) }

  def starts_before_ends
    return true if starts.blank? || ends.blank?
    errors.add(:starts, "cannot be after ends") if starts > ends
  end

  def populate_blank_starts
    self.starts = Time.zone.now if starts.blank?
  end
end
