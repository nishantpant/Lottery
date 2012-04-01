class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :description
      t.timestamp :lottery_date
      t.integer :owner_id
      t.integer :dollar_amount

      t.timestamps
    end
  end
end
