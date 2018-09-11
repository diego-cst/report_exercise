
class Report < ApplicationRecord

  # def self.most_popular(year, month, day)
  #   grouped_occurences = Report.where('extract(year from raw_time) = ?', year)
  #                       .where('extract(month from raw_time) = ?', month)
  #                       .where('extract(day from raw_time) = ?', day).group("reports.raw_id").count

  #   grouped_occurences.sort_by { |k, v| -v}.take(10)
  # end

end
