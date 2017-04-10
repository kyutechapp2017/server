class CreateIntermediates < ActiveRecord::Migration[5.0]
  def change
    create_table :intermediates do |t|
      t.unsigned_integer :subject_id
      t.unsigned_integer :week_period_id

      t.timestamps
    end
  end
end
