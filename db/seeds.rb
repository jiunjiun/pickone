# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# Create Event
event = Event.create!(
  user_id: 1, title: 'aaa', desc: 'desc',
  items_attributes: [
    {name: '谷哥店', link: 'https://www.google.com.tw/'},
    {name: '雅虎店', link: 'https://tw.yahoo.com/'},
    {name: '蘋果店', link: 'http://www.apple.com/tw/'},
  ]
)

# Create Vote
event.items.first.votes.create user_id: 1

event.items[1].votes.create user_id: 1
event.items[1].votes.create user_id: 1
event.items[1].votes.create user_id: 1

event.items.last.votes.create user_id: 1
event.items.last.votes.create user_id: 1
