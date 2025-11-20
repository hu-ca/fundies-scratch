use context dcic2024

include csv
include data-source

penguins =
  load-table: number, species, island, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g, sex, year
  source: csv-table-file("penguins.csv", default-options)
    sanitize number using num-sanitizer
    sanitize bill_length_mm using num-sanitizer
    sanitize body_mass_g using num-sanitizer
end

penguins

# Scalar Processing Example:
# Question: Does this penguin row represent a male penguin?

#|fun count-males(t :: Table) -> Number:
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
   count-males(penguins)|#



#transformation
fun grams-to-lbs(t :: Table) -> Table:
  transform-column(
    t, "m",
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
    row: 20 / 453.6           
    row: 10 / 453.6      
    row: 2000 / 453.6      
    row: 100 / 453.6         
    end
end

#selection
fun select-penguins(t :: Table) -> Table:
  doc: "filters penguins that are the species Gentoo and that have bill length greater than 20 mm"
  filter-with(t, lam(r :: Row): (r["species"] == "Gentoo") and (r["bill_length_mm"] >= 53) end)
end

select-penguins(penguins)

#|check:
  select-penguins(penguins) is 
  table: number, species, island, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g, sex, year
    row: 185, "Gentoo"
  end
   end |#