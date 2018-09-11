class ReportsController < ApplicationController

  def most_popular

    year = params[:date][:year]
    month = params[:date][:month]
    day = params[:date][:day]

    @grouped_occurences = Report.where('extract(year from raw_time) = ?', year)
                        .where('extract(month from raw_time) = ?', month)
                        .where('extract(day from raw_time) = ?', day).group("reports.raw_id").count

    @reports = @grouped_occurences.sort_by { |k, v| -v}.take(10)

  end



end

