class CreateTraces < ActiveRecord::Migration[5.1]
  def change
    create_table :traces do |t|
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
