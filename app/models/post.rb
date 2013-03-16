class Post < ActiveRecord::Base
  belongs_to :type
  attr_accessible :content, :title, :type_id

  validates_presence_of :title

  default_scope order('ID DESC')
end
