use context dcic2024
include csv
include data-source

orders = table: time, amount
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end


fun is-high-value(o :: Row) -> Boolean:
  o["amount"] >= 8.0
end

filter-with(orders, lam(o): o["amount"] >= 8.0 end)

new-high-orders = filter-with(orders, is-high-value)

fun is-morning(o :: Row) -> Boolean:
  o["time"] < "12:00"
where:
  is-morning(orders.row-n(0)) is true
  is-morning(orders.row-n(4)) is false
end

morning-orders = filter-with(orders, is-morning)

filter-with(orders, lam(o): o["time"] < "12:00" end)

order-by(orders, "time", false)


latest-morning-orders = order-by(morning-orders, "time", false)

latest-morning-orders

latest-morning-orders.row-n(0)["amount"]

photos = load-table:
  location :: String,
  subject :: String,
  date :: Number
  source: csv-table-url("https://pdi.run/f25-2000-photos.csv", default-options)
end

photos

fun contains-forest(o :: Row) -> Boolean:
  o["subject"] == "Forest"
end

forest-table = filter-with(photos, contains-forest)

#true means ascending order and false means descending order
dated-forest-table = order-by(forest-table, "date", false)

dated-forest-table

dated-forest-table.row-n(0)["location"]

count(forest-table, "location")

freq-bar-chart(photos, "location")