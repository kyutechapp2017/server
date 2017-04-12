class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.unsigned_integer :campus_id
      t.text :url, :null => false
      t.integer :year
      t.string :name, :null => false
      t.integer :code
      t.string :teacher
      t.text :department
      t.string :classification
      t.unsigned_integer :num_of_unit
      t.string :grade
      t.string :term
      t.string :number
      t.string :place
      t.datetime :update
      t.text :outline
      t.text :placement
      t.text :item
      t.text :procedure
      t.text :goal
      t.text :criteria
      t.text :preparation
      t.text :keyword
      t.text :textbook
      t.text :reference
      t.text :note
      t.text :email

      t.timestamps
    end
    add_index :subjects, :url, unique: true
    add_index :subjects, :code, unique: true
  end
end
