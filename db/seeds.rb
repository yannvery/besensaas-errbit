puts "Seeding database"
puts "-------------------------------"

# Create an initial Admin User
admin_username = "Yann"
admin_email = "yann.very@besensaas.com"
admin_pass  = 'Kalt3!kfi:MtT'

puts "Creating an initial admin user:"
puts "-- username: #{admin_username}" if Errbit::Config.user_has_username
puts "-- email:    #{admin_email}"
puts "-- password: #{admin_pass}"
puts ""
puts "Be sure to change these credentials ASAP!"
user = User.where(:email => admin_email).first || User.new({
  :name                   => 'Yann',
  :email                  => admin_email,
  :password               => admin_pass,
  :password_confirmation  => admin_pass
})
user.username = admin_username if Errbit::Config.user_has_username

user.admin = true
user.save!

