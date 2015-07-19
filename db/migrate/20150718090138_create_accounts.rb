class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :month
      t.integer :year

      t.timestamps null: false
    end
  end
end
