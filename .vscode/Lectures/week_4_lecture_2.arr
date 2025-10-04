use context dcic2024
include csv
include data-source

items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number, price :: Number
  row: "Sword of Dawn",           23,  -87, 8
  row: "Healing Potion",         -45,   12, 9
  row: "Dragon Shield",           78,  -56, 5
  row: "Magic Staff",             -9,   64, 10
  row: "Elixir of Strength",      51,  -33, 20
  row: "Cloak of Invisibility",  -66,    5, 55
  row: "Ring of Fire",            38,  -92, 100
  row: "Boots of Swiftness",     -17,   49, 25
  row: "Amulet of Protection",    82,  -74, 27
  row: "Orb of Wisdom",          -29,  -21, 28
end

items

fun subtract-1(n :: Number) -> Number:
  doc: "subtracts 1 from input"
  n - 1
where:
  subtract-1(10) is 9
  subtract-1(0) is -1
  subtract-1(-3.5) is -4.5
end

moved-items = transform-column(items, "x-coordinate", subtract-1)

#transform-column(items, "x-coordinate", lam(n): n - 1 end)


#items-with-dist = build-column(items, "distance-squared", calc-distance-squared)

#items-with-dist

fun pull-closer(n :: Number) -> Number:
  doc: "multiples coordinates by 0.9 to pull 10% closer to origin"
  n * 0.9
where:
  pull-closer(10) is 9
  pull-closer(-20) is -18
end

items-pulled-closer = transform-column(transform-column(items, "x-coordinate", pull-closer), "y-coordinate", pull-closer)


fun calc-distance-squared(r :: Row) -> Number:
  doc: "calculates squared distance from origin (avoids RoughNum)"
  num-to-rational(num-sqrt(
      num-sqr(r["x-coordinate"]) + num-sqr(r["y-coordinate"])))
where:
    calc-distance-squared(items.row-n(0)) is-roughly num-to-rational(num-sqrt(num-sqr(23) + num-sqr(-87)))
      
    calc-distance-squared(items.row-n(9)) is-roughly num-to-rational(num-sqrt(num-sqr(-29) + num-sqr(-21)))
end

items-with-dist = build-column(items, "distance-squared", calc-distance-squared)


items-sorted = order-by(items-with-dist, "distance-squared", true)

closest-item = items-sorted.row-n(0)["item"]

items-with-dist
closest-item

fun obfuscate(s :: String) -> String:
  doc: ""
  string-repeat("X", string-length(s))
where: 
  obfuscate("hello") is "XXXXX"
  obfuscate("hello world") is "XXXXXXXXXXX"
end

item-obfuscated = transform-column(items, "item", obfuscate)

item-obfuscated

fun obfuscation(t :: Table) -> Table:
  transform-column(items, "item", obfuscate)
end

obfuscation(items)

fun add-vat(t :: Table) -> Table:
  build-column(items, "total", ("price" * 1.2))
end

add-vat(items)
