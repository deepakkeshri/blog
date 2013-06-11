class Comment < ActiveRecord::Base
  attr_accessible :heading,:matter
  
  belongs_to :atricle, {:foreign_key => "article_id"}
end
