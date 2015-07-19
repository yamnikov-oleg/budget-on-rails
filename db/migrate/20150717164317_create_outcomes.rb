class CreateOutcomes < ActiveRecord::Migration
  def change
    create_table :outcomes do |t|
      t.string :name
      t.integer :value

      t.timestamps null: false
    end
  end
end
