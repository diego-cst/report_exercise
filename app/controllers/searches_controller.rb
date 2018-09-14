class SearchesController < ApplicationController
before_action :set_date

  def most_popular
    reports_on_date_by_device = Report.reports_on_date(@date).group("device_id").count
    @most_popular = reports_on_date_by_device.sort_by { |device_id, popularity| -popularity}.take(10)
  end

  def devices_per_day
    @device_type = params[:device_type]
    @device_status = params[:device_status]
    @results = {}
    for i in (0..30) do
      device_count = Report.joins(:device).where('devices.device_type = ?', @device_type).where('reports.status = ?', @device_status)
                          .where('extract(year from reports.raw_time) = ?', @date.year)
                          .where('extract(month from reports.raw_time) = ?', @date.month)
                          .where('extract(day from reports.raw_time) = ?', @date.day).count
      @results[@date] = device_count
      @date -= 1
    end
    @results
  end

  private

  def set_date
    year = params[:date][:year]
    month = params[:date][:month]
    day = params[:date][:day]

    @date = Date.parse("#{day}-#{month}-#{year}")
  end

end
