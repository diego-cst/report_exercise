class Device < ApplicationRecord
  has_many :reports

  def popularity(given_date)
    date = given_date.to_date
    year = date.year
    month = date.month
    day = date.day

    Report.where('extract(year from reports.raw_time) = ?', year)
                       .where('extract(month from reports.raw_time) = ?', month)
                       .where('extract(day from reports.raw_time) = ?', day)
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
    return delta
  end

end
