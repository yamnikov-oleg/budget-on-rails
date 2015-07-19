class AddMoneyToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :money, :integer
  end
end
