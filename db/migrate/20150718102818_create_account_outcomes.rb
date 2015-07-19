class CreateAccountOutcomes < ActiveRecord::Migration
  def change
    create_table :account_outcomes do |t|
      t.references :account, index: true, foreign_key: true
      t.string :name
      t.integer :value

      t.timestamps null: false
    end
  end
end
