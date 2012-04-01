class CreateLotterytickets < ActiveRecord::Migration
  def change
    create_table :lotterytickets do |t|
      t.integer :group_id
      t.integer :num1
      t.integer :num2
      t.integer :num3
      t.integer :num4
      t.integer :num5
      t.integer :megaplier

      t.timestamps
    end
  end
end
