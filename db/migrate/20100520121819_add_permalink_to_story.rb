class AddPermalinkToStory < ActiveRecord::Migration
  def self.up
    add_column :stories, :permalink, :string
  end

  def self.down
    drop_column :stories, :permalink
  end
end
