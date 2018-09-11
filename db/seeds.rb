require 'csv'

# puts "Destroying all reports..."
# Report.destroy_all

# puts "Resetting IDs..."
# ActiveRecord::Base.connection.tables.each do |t|
#   ActiveRecord::Base.connection.reset_pk_sequence!(t)
# end

puts "Creating reports..."

CSV.foreach('db/csv/report.csv', headers: :first_row) do |row|
  # report_found = Report.where(raw_id: row[1])
  # unless report_found
    Report.create!(raw_time: row[0], raw_id: row[1], device_type: row[2], status: row[3])
  # end
end

puts "Created #{Report.all.length} reports"


