class PagesController < ApplicationController
  def home
  end

  def view_1
  end

  def view_2
    @device_types = Device.distinct.pluck(:device_type)
    @statuses = Report.distinct.pluck(:status)
  end
end
