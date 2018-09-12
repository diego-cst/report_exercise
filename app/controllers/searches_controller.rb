class SearchesController < ApplicationController
before_action :set_date

  def most_popular
    reports_on_date_by_device = Report.reports_on_date(@date).group("device_id").count.take(10)
    @most_popular = reports_on_date_by_device.sort_by { |device_id, popularity| -popularity}
  end

  def device_per_day(device_type, device_status)
    device_type = params[:device_type]
    device_status = params[:device_status]

    Report.reports_on_date(@date).where(device_type: device_type).where(status: device_status)
  end

  private

  def set_date
    year = params[:date][:year]
    month = params[:date][:month]
    day = params[:date][:day]

    @date = Date.parse("#{day}-#{month}-#{year}")
  end

end
