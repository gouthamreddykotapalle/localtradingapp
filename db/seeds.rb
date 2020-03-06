# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
sell_posts = [
    {:title => '2019 Camry 21000 Mileages', :user_id => 'foo@no.com', :category => 'vehicle', :price => 12000},
    {:title => '2015 Tesla 51000 Mileages', :user_id => 'foo@no.com', :category => 'vehicle', :price => 18000},
    {:title => 'Homemade Da Vinci masterpieces', :user_id => 'naive@no.com', :category => 'art', :price => 10},
    {:title => 'Epic Chair', :user_id => 'tom@blah.com', :category => 'furniture', :price => 58}
]

accounts = [
    {:email => "a@b.com", :password => "123", :first_name => "NO", :last_name => "ONE"}
]

sell_posts.each do |post|
  SellPost.create!(post)
end

accounts.each do |account|
  User.create!(account)
end