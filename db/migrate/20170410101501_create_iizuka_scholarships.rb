class CreateIizukaScholarships < ActiveRecord::Migration[5.0]
  def change
    create_table :iizuka_scholarships do |t|
      t.text :url, :null => false
      t.string :title
      t.datetime :date
      t.text :content
      t.string :note
      t.string :attachment_1
      t.text :attachment_1_url
      t.string :attachment_2
      t.text :attachment_2_url
      t.string :finish

      t.timestamps
    end
    add_index :iizuka_scholarships, :date
    add_index :iizuka_scholarships, :url, unique: true
  end
end
