class CreateTzOffsets < ActiveRecord::Migration
  def change
    create_table :tz_offsets do |t|
      t.string :tz_name, unique: true
      t.integer :offset

      t.timestamps
    end
  end
end