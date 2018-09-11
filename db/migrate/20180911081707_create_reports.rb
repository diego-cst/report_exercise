class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.datetime :raw_time
      t.string :device_type
      t.boolean :status
      t.string :raw_id

      t.timestamps
    end
  end
end
