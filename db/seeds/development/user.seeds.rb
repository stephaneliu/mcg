User.find_or_create_by!(email: 'sliu@dev.com') do |user|
  user.password = 'testtest'
  user.confirm
  user.admin!
  puts "Created user: #{user.email} / testtest"
end
