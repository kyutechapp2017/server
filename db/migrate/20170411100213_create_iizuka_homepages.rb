class CreateIizukaHomepages < ActiveRecord::Migration[5.0]
  def change
    create_table :iizuka_homepages do |t|
      t.text :url
      t.unsigned_integer :board_id
      t.datetime :date
      t.text :place
      t.text :content
      t.text :note
      t.text :inquiry

      t.timestamps
    end
    add_index :iizuka_homepages, :date
  end
end
