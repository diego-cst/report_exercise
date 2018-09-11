require 'csv'

# puts "Destroying all reports..."
# Report.destroy_all

# puts "Resetting IDs..."
# ActiveRecord::Base.connection.tables.each do |t|
#   ActiveRecord::Base.connection.reset_pk_sequence!(t)
# end

puts "Creating reports..."

CSV.foreach('db/csv/report.csv', headers: :first_row) do |row|
  device_found = Device.where(raw_id: row[1])
  if device_found
    report = Report.new(raw_time: row[0], status: row[3])
    report.device = device_found
  else
    device = Device.create!(raw_id: row[1], device_type: row[2])
    report = Report.new(raw_time: row[0], status: row[3])
    report.device = device
  end
end

puts "Created #{Device.all.length} devices and #{Report.all.length} reports"


