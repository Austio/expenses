class CreateExpenditures < ActiveRecord::Migration
  def change
    create_table :expenditures do |t|
      t.integer :user_id
      t.integer :expense_id
      t.timestamps
    end
  end
end
