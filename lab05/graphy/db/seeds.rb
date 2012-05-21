# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category1 = ActionCategory.create(:name => 'Category 1')
category2 = ActionCategory.create(:name => 'Category 2')
category3 = ActionCategory.create(:name => 'Category 2')
category4 = ActionCategory.create(:name => 'Category 2')
category5 = ActionCategory.create(:name => 'Category 2')

action_item_1 = ActionItem.create(:name => "Action Item 1")
action_item_1.action_category = category1
action_item_1.save!

metric1 = Metric.create(:name => "Metric 1")
metric2 = Metric.create(:name => "Metric 2")
metric3 = Metric.create(:name => "Metric 3")

user = User.create(:first_name => "Example", :last_name => "User", :password => "password", :email => "user@example.com")
john = User.create(:first_name => "John", :last_name => "Doe", :password => "password", :email => "john.doe@example.com")
jane = User.create(:first_name => "Jane", :last_name => "Roe", :password => "password", :email => "jane.roe@example.com")

def supply_ratings u, action_item, metric, ratings
  u.add_item_if_new action_item
  uai = u.user_action_items.first
  ratings.each_index do |i|
    r = Rating.new
    r.user_action_item = uai
    r.week_number = i+1
    r.metric = metric
    r.value = ratings[i]
    uai.ratings << r
  end
end

supply_ratings user, action_item_1, metric1, [-3, -2, -1,  0,  1,  2,  3,  3]
supply_ratings john, action_item_1, metric1, [ 3,  2,  1,  0,  0, -1, -2, -3]
supply_ratings jane, action_item_1, metric1, [-1,  2,  0, -3,  1,  2,  3, -2]

supply_ratings user, action_item_1, metric2, [ 3,  2,  1,  0,  0, -1, -2, -3]
supply_ratings john, action_item_1, metric2, [-1,  2,  0, -3,  1,  2,  3, -2]
supply_ratings jane, action_item_1, metric2, [-3, -2, -1,  0,  1,  2,  3,  3]

supply_ratings user, action_item_1, metric3, [-1,  2,  0, -3,  1,  2,  3, -2]
supply_ratings john, action_item_1, metric3, [-3, -2, -1,  0,  1,  2,  3,  3]
supply_ratings jane, action_item_1, metric3, [ 3,  2,  1,  0,  0, -1, -2, -3]

user.friends << john
user.friends << jane
