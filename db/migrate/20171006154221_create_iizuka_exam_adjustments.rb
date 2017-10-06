class CreateIizukaExamAdjustments < ActiveRecord::Migration[5.0]
  def change
    create_table :iizuka_exam_adjustments do |t|
      t.text :url
      t.string :title
      t.datetime :date
      t.string :time
      t.string :place_or_before
      t.text :content
      t.string :department
      t.string :grade
      t.string :responsibility
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
    add_index :iizuka_exam_adjustments, :date
    add_index :iizuka_exam_adjustments, :url, unique: true, length: 256
  end
end
