class CreateInvitations < ActiveRecord::Migration
  def self.up
    create_table :invitations do |t|
      t.integer :story_id
      t.integer :user_id
      t.string :token

      t.timestamps
    end
  end

  def self.down
    drop_table :invitations
  end
end
