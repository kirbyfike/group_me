class User < ActiveRecord::Base
  belongs_to :group


  belongs_to :organization


  attr_accessible :name
end
