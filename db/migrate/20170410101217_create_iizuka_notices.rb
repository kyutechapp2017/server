class CreateIizukaNotices < ActiveRecord::Migration[5.0]
  def change
    create_table :iizuka_notices do |t|
      t.text :url, null: false
      t.string :title
      t.datetime :date
      t.string :period
      t.string :place_or_before
      t.text :content
      t.string :department
      t.string :grade
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
    add_index :iizuka_notices, :date
    add_index :iizuka_notices, :url, unique: true
  end
end
