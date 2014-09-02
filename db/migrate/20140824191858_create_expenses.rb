class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.datetime :date
      t.integer :amount
      t.text :comment
      t.text :description

      t.integer :user_id

      t.timestamps
    end
  end
end
