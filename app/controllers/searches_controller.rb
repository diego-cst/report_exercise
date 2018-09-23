class SearchesController < ApplicationController
before_action :set_date

  def most_popular
    @result = Reports::MostPopularDevicesOnDayService.new(@date).call
  end

  def devices_per_day
    @device_type = report_params[:device_type]
    @device_status = report_params[:device_status]
    @results = Reports::DevicesPerDayService.new(@date, @device_type, @device_status).call
  end

  private

  def report_params
    params.permit(:device_type, :device_status, date: [:year, :month, :day])
  end

  def set_date
    year = report_params[:date][:year]
    month = report_params[:date][:month]
    day = report_params[:date][:day]

    @date = Date.parse("#{day}-#{month}-#{year}")
  end

end
