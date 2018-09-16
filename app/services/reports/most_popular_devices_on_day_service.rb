module Reports
  class MostPopularDevicesOnDayService

    attr_accessor :date

    def initialize date
      @date = date
      @scope = nil
    end

    def call
      filter_reports_by_date
      count_by_device
      order_by_popularity
    end

    private

    def filter_reports_by_date
      @scope = Report.where('extract(year from reports.raw_time) = ?', date.year)
                    .where('extract(month from reports.raw_time) = ?', date.month)
                    .where('extract(day from reports.raw_time) = ?', date.day)
    end

    def count_by_device
      @scope = @scope.group("device_id").count
    end

    def order_by_popularity
      @scope = @scope.sort_by { |device_id, popularity| -popularity}
    end

  end
end
