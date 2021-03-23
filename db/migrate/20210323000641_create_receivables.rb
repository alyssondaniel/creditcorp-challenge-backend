class CreateReceivables < ActiveRecord::Migration[6.1]
  def change
    create_table :receivables do |t|
      t.decimal :net_value, precision: 9, scale: 2, default: 0
      t.date :expired_at, null: false
      t.string :key, null: false

      t.timestamps
    end
    add_index :receivables, :key, unique: true
  end
end
