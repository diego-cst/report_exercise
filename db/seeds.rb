require 'csv'
puts "Creating devices and reports..."

CSV.foreach('db/csv/report.csv', headers: :first_row) do |row|
  device_found = Device.where(raw_id: row[1]).first
  if device_found
    report = Report.new(raw_time: row[0], status: row[3])
    report.device = device_found
    report.save
  else
    device = Device.create!(raw_id: row[1], device_type: row[2])
    report = Report.new(raw_time: row[0], status: row[3])
    report.device = device
    report.save
  end
end

puts "Created #{Device.all.length} devices and #{Report.all.length} reports"


