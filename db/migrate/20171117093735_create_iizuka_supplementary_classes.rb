class CreateIizukaSupplementaryClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :iizuka_supplementary_classes do |t|
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
    add_index :iizuka_supplementary_classes, :date
    add_index :iizuka_supplementary_classes, :url, unique: true, length: 256
  end
end
