class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :article_id
      t.string :heading
      t.string :matter
      t.integer :like_comment_no, :default => 0
      t.integer :comment_comment_no, :default => 0
      t.timestamps
    end
  add_index("comments", "article_id")
  end
  
  
  def self.down
    drop_table :comments
  end
  
end
