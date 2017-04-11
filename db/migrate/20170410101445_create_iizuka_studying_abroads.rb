class CreateIizukaStudyingAbroads < ActiveRecord::Migration[5.0]
  def change
    create_table :iizuka_studying_abroads do |t|
      t.text :url
      t.string :title
      t.datetime :date
      t.string :responsibility
      t.text :content
      t.string :attachment_1
      t.text :attachment_1_url
      t.string :attachment_2
      t.text :attachment_2_url
      t.string :attachment_3
      t.text :attachment_3_url
      t.string :attachment_4
      t.text :attachment_4_url

      t.timestamps
    end
    add_index :iizuka_studying_abroads, :date
    add_index :iizuka_studying_abroads, :url, unique: true
  end
end
