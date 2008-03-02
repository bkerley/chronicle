class PostsMorefields < ActiveRecord::Migration
  def self.up
		add_column :posts, :excerpt, :text
  end

  def self.down
		remove_column :posts, :excerpt
  end
end
