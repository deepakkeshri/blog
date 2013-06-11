class Article < ActiveRecord::Base
   attr_accessible :heading, :author,:content
   
   has_many :comments
end
