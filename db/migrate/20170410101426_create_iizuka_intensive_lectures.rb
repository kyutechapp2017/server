class CreateIizukaIntensiveLectures < ActiveRecord::Migration[5.0]
  def change
    create_table :iizuka_intensive_lectures do |t|
      t.text :url, null: false
      t.string :title
      t.datetime :date
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
    add_index :iizuka_intensive_lectures, :date
    add_index :iizuka_intensive_lectures, :url, unique: true, length: 256
  end
end
