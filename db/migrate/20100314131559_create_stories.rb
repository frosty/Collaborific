class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.string :title
      t.text :description
      t.integer :owner
      t.integer :fic_length
      t.boolean :fic_length_enforce

      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end
