class Tweet < ActiveRecord::Base
belongs_to :user
#presence...if contents is brank, it become error
validates :user_id, :content, :presence => true
validates :content, :length => {:maximum => 140}
end
