json.chart do
  json.labels items.pluck(:name)
  json.data items.map {|item| item.votes.count }
end
