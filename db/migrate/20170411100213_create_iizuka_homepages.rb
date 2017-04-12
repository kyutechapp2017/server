class CreateIizukaHomepages < ActiveRecord::Migration[5.0]
  def change
    create_table :iizuka_homepages do |t|
      t.text :url, null: false
      t.unsigned_integer :board_id, null: false
      t.datetime :date
      t.text :place
      t.text :content
      t.text :note
      t.text :inquiry

      t.timestamps
    end
    add_index :iizuka_homepages, :date
    add_index :iizuka_homepages, :url, unique: true
  end
end
