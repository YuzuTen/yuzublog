# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
User.create(:family_name  => 'Truesdell', :given_name => 'Jason',
            :display_name => "Jason Truesdell",
            :password => "rails4popcornandgum",
            :email => "jason@jagaimo.com",
            :role => "admin")
