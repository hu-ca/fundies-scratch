use context dcic2024

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

filter-with :: (t :: Table, keep :: (Row -> Boolean)) -> Table

new-high-orders = filter-with(orders, is-high-value)

