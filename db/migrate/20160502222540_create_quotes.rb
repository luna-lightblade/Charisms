class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :quote
      t.text :sayer
      t.text :context
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :quotes, [:user_id, :created_at]
  end
end
