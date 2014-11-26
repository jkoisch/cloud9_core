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

class Cloud9::User < ActiveRecord::Base



end
