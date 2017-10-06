class CreateIizukaAlterations < ActiveRecord::Migration[5.0]
  def change
    create_table :iizuka_alterations do |t|
      t.text :url
      t.string :title
      t.string :subject
      t.string :responsibility
      t.string :department
      t.string :grade
      t.datetime :date
      t.string :period
      t.string :note
      t.string :string
      t.string :place_or_before
      t.string :after
      t.text :content

      t.timestamps
    end
    add_index :iizuka_alterations, :date
    add_index :iizuka_alterations, :url, unique: true, length: 256
  end
end
