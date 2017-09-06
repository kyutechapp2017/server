class CreateIizukaCalls < ActiveRecord::Migration[5.0]
  def change
    create_table :iizuka_calls do |t|
      t.text :url, null: false
      t.string :title
      t.datetime :date
      t.text :content
      t.string :department
      t.string :grade
      t.string :note
      t.string :finish

      t.timestamps
    end
    add_index :iizuka_calls, :date
    add_index :iizuka_calls, :url, unique: true, length: 256
  end
end
