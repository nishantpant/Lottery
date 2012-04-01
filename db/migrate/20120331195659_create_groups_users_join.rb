class CreateGroupsUsersJoin < ActiveRecord::Migration
  def up
    create_table 'groups_users', :id => false do |t|
      t.column 'user_id', :integer
      t.column 'group_id', :integer
    end
  end

  def down
    drop_table 'groups_users'
  end
end
