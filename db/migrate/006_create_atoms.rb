class CreateAtoms < ActiveRecord::Migration
  def self.up
    create_table :atoms do |t|
			t.string :url
			t.string :name
			t.datetime :updated
      t.timestamps
    end
  end

  def self.down
    drop_table :atoms
  end
end
