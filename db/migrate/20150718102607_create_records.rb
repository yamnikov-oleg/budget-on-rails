class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.references :account, index: true, foreign_key: true
      t.integer :day
      t.integer :value
      t.integer :limit
      t.string :desc

      t.timestamps null: false
    end
  end
end
