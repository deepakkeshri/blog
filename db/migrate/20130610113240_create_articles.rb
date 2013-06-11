class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :author
      t.string :heading
      t.text :content
      t.integer :like_no, :default => 0
      t.integer :comment_no, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end

end
