class CreateFics < ActiveRecord::Migration
  def self.up
    create_table :fics do |t|
      t.integer :user_id
      t.integer :story_id
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :fics
  end
end
