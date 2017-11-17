class CreateIntermediates < ActiveRecord::Migration[5.0]
  def change
    create_table :intermediates do |t|
      t.references :subject, foreign_key: true
      t.references :week_period, foreign_key: true

      t.timestamps
    end
  end
end
