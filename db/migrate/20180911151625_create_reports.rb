class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.datetime :raw_time
      t.string :status
      t.references :device, foreign_key: true

      t.timestamps
    end
  end
end
