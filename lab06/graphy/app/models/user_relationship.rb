class UserRelationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
end
