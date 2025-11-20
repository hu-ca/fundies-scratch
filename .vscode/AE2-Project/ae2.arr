use context starter2024

include csv
include data-source

penguins =
  load-table: number, species, island, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g, sex, year
  source: csv-table-file("penguins.csv", default-options)
end

penguins

# Scalar Processing Example:
# Question: Does this penguin row represent a male penguin?

fun count-males(t :: Table) -> Number:
  var total = 0
  block:
  for each(r :: Row from t):
    if r["sex"] == "male":
      total := total + 1
    else:
      total := total + 0
    end
  end
  total
  end
end
count-males(penguins)



#transformation
fun grams-to-lbs(t :: Table) -> Table:
  transform-column(
    t, "body_mass_g",
    lam(a :: Number): a / 453.6
    end)
where:
  # minimal unit-style examples for the function behavior
  p =
    table: m :: Number
      row: 20
      row:   10
      row:  2000
      row:  100
    end
  
  grams-to-lbs(p) is
  table: m :: Number
    row: 20 / 453.6           # early arrival => unchanged
    row:  10 / 453.6      # remains 0
    row: 2000 / 453.6      # discounted
    row:  100 / 453.6           # unchanged (too large to discount)
    end
end
  