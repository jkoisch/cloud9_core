# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :text
#  admin      :boolean
#  created_at :datetime
#  updated_at :datetime
#

#A Cloud9::User is just a user on a system. We will use this abstraction to manage people's passwords and ultimately
# to connect to the internal Cloud9 security apparatus. For example, we will use User to update a user's password or
# email through this automation
class Cloud9::User < ActiveRecord::Base



end
