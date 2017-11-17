class CreateIizukaSupplementaryLectures < ActiveRecord::Migration[5.0]
  def change
    create_table :iizuka_supplementary_lectures do |t|
      t.text :url
      t.datetime :date
      t.string :peirod
      t.string :subject
      t.string :responsibility
      t.string :place_or_before
      t.string :department
      t.string :grade
      t.string :note

      t.timestamps
    end
    add_index :iizuka_supplementary_lectures, :date
    add_index :iizuka_supplementary_lectures, :url, unique: true, length: 256
  end
end
