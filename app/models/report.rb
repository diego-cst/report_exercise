class Report < ApplicationRecord
  belongs_to :device

  # def self.reports_on_date(date)
  #   Report.where('extract(year from reports.raw_time) = ?', date.year)
  #         .where('extract(month from reports.raw_time) = ?', date.month)
  #         .where('extract(day from reports.raw_time) = ?', date.day)
  # end
end
