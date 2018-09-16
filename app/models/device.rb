class Device < ApplicationRecord
  has_many :reports

  validates :raw_id, :device_type, presence: true

  def popularity(date)
    Report.reports_per_day(date)
          .where(device_id: self.id).count
  end

  def delta_popularity(date_1, date_2)
    date_1_reports = popularity(date_1).to_f
    date_2_reports = popularity(date_2).to_f

    if date_1_reports == 0
      delta = "Increase from 0"
    else
      delta = (((date_2_reports - date_1_reports)/date_1_reports)*100).round(2)
    end
    delta
  end

end
