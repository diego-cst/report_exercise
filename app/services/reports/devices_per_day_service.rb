module Reports
  class DevicesPerDayService

    attr_accessor :date, :device_status, :device_type

    def initialize(date, device_type, device_status)
      @date = date
      @device_type = device_type
      @device_status = device_status
      @scope = nil
    end

    def call
      result
    end

    private

    def filter_by_device_type
      @scope = Report.joins(:device)
                     .where('devices.device_type = ?', device_type)
    end

    def filter_by_device_status
      @scope = @scope.where('reports.status = ?', device_status)
    end


    def filter_by_date
      @scope = @scope.where('extract(year from reports.raw_time) = ?', date.year)
                    .where('extract(month from reports.raw_time) = ?', date.month)
                    .where('extract(day from reports.raw_time) = ?', date.day).count
    end

    def result
      results = {}

      for i in (0..30) do
        filter_by_device_type
        filter_by_device_status

        results[@date] = filter_by_date
        @date -= 1
      end

      results
    end

  end
end
