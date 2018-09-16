class Report < ApplicationRecord
  belongs_to :device

  validates :device_id, :raw_time, presence: true

  def self.reports_per_day(date)
    where('extract(year from reports.raw_time) = ?', date.year)
    .where('extract(month from reports.raw_time) = ?', date.month)
    .where('extract(day from reports.raw_time) = ?', date.day)
  end
end
