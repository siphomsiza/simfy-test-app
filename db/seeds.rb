# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["siphosmall@gmail.com", "jessica@e-merge.co.za","simfy@test.co.za"].each do |email|
  users = User.where(:email => email)
  unless users.blank?
    users.each do |u| 
      u.email = email
      u.password = "simfy12345"
      u.admin = true 
      u.save
    end
  else
    user = User.new(:email => email)
    user.password = "simfy12345" 
    user.admin = true 
    user.save      
  end 
end