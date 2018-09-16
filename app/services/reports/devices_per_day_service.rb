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

    def filter_by_date
      @scope = Report.reports_per_day(date)
    end

    def filter_by_device_type
      @scope = @scope.joins(:device)
                     .where('devices.device_type = ?', device_type)
    end

    def filter_by_device_status
      @scope = @scope.where('reports.status = ?', device_status)
    end

    def device_count
      @scope = @scope.count
    end

    def result
      results = {}

      for i in (0..30) do
        filter_by_date
        filter_by_device_type
        filter_by_device_status

        results[@date] = device_count
        @date -= 1
      end

      results
    end

  end
end
