class CreateIdOfBulletinboards < ActiveRecord::Migration[5.0]
  def change
    create_table :id_of_bulletinboards do |t|
      t.integer :did
      t.integer :rid

      t.timestamps
    end
  end
end
