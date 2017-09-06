class CreateIizukaOthers < ActiveRecord::Migration[5.0]
  def change
    create_table :iizuka_others do |t|
      t.text :url, null: false
      t.unsigned_integer :board_id, null: false
      t.string :title
      t.datetime :date
      t.string :responsibility
      t.text :content
      t.string :note
      t.string :attachment_1
      t.text :attachment_1_url
      t.string :attachment_2
      t.text :attachment_2_url
      t.string :attachment_3
      t.text :attachment_3_url
      t.string :attachment_4
      t.text :attachment_4_url
      t.string :attachment_5
      t.text :attachment_5_url

      t.timestamps
    end
    add_index :iizuka_others, :date
    add_index :iizuka_others, :url, unique: true, length: 256
  end
end
