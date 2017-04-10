class CreateWeekPeriods < ActiveRecord::Migration[5.0]
  def change
    create_table :week_periods do |t|
      t.unsigned_integer :week_num
      t.unsigned_integer :period_num

      t.timestamps
    end
  end
end
