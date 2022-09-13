class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.float :amount
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
