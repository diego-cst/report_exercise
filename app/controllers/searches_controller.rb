class SearchesController < ApplicationController
  def most_popular
    year = params[:date][:year]
    month = params[:date][:month]
    day = params[:date][:day]

    @date = Date.parse("#{day}-#{month}-#{year}")

    reports_on_date = Report.where('extract(year from reports.raw_time) = ?', year)
                            .where('extract(month from reports.raw_time) = ?', month)
                            .where('extract(day from reports.raw_time) = ?', day).take(10)
    # => returns array of report objects
    @most_popular = reports_on_date.sort_by { |report| -report.device.popularity(@date)}
  end
end



 # devices_on_date = Report.where('extract(year from reports.raw_time) = ?', 2017)
    #                   .where('extract(month from reports.raw_time) = ?', 5)
    #                   .where('extract(day from reports.raw_time) = ?', 1).group(:device_id).count
                      # => {1=>8, 2=>7}
