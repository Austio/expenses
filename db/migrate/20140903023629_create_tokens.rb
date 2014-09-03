class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.integer :user_id
      t.datetime :expiration
      t.text :key

      t.timestamps
    end
  end
end
