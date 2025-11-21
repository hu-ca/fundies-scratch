use context dcic2024

include csv
include data-source

penguins =
  load-table: number,species,island,bill_length_mm, bill_depth_mm,flipper_length_mm,body_mass_g,sex,year
  source: csv-table-file("penguins.csv", default-options)
    sanitize number using num-sanitizer
    sanitize bill_length_mm using num-sanitizer
    sanitize bill_depth_mm using num-sanitizer
    sanitize body_mass_g using num-sanitizer
    sanitize flipper_length_mm using num-sanitizer
    sanitize year using num-sanitizer
end

#penguins

#Scalar Processing Example

#|fun count-males(l):
  cases (List) l:
    | empty      => 0
    | link(f, r) => 
      if f + count-males(r)
  end
where:
  my-sum([list: 7, 8, 9]) is 24
   end|#
#Scalar Processing    
fun count-males(str-list :: List<String>) -> Number:
  doc: "counts the number of male penguins and returns the amount"
  block:
    var total = 0
    for each(s from str-list):
      if s == "male":
        total := total + 1
      else:
        total
      end
    end
    total
  end
end
check:
  penguins_1 = 
    table: number, species, island, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g, sex, year
      row: 14, "Adelie", "Torgersen", 34.6, 21.1, 198, 4400, "male", 2007
    row: 259, "Gentoo", "Biscoe", 53.4, 15.8, 219, 5500, "male", 2009
      row: 302, "Chinstrap", "Dream", 50.5, 18.4, 200, 3400, "female", 2008
  end
  
  count-males(penguins_1.column("sex")) is 2
end
count-males(penguins.column("sex"))

    #|fun count-males() -> Boolean:
  var total = 0
  block:
  for each(r :: Row from t):
    if t.row-n(r).column("sex") == "male":
      total := total + 1
    else:
      total := total + 0
    end
  end
  total
  end
       end|#

#count-males(penguins)

#transformation
fun g-to-kg(n :: Number) -> Number:
  doc: "helper function that converts grams to kilograms"
  n / 1000
end

fun grams-to-kilograms(l :: List<Number>) -> List<Number>:
  doc: "uses the helper function to convert first part of list and then rest of list from grams to kilograms"
  cases(List) l:
    | empty => empty
    | link(first, rest) =>
      link(g-to-kg(first), grams-to-kilograms(rest))
  end
end
check:
  penguins_2 = 
    table: number, species, island, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g, sex, year
      row: 14, "Adelie", "Torgersen", 34.6, 21.1, 198, 4400, "male", 2007
    row: 259, "Gentoo", "Biscoe", 53.4, 15.8, 219, 5500, "male", 2009
      row: 302, "Chinstrap", "Dream", 50.5, 18.4, 200, 3400, "female", 2008
  end
  
  grams-to-kilograms(penguins_2.column("body_mass_g")) is 
  [list: 4.4, 5.5, 3.4]
end
#grams-to-kilograms(penguins.column("body_mass_g"))


#selection
fun select-penguins(t :: Table) -> Table:
  doc: "filters penguins that are the species Gentoo and that have bill length greater than 53 mm"
  filter-with(t, lam(r :: Row): (r["species"] == "Gentoo") and (r["bill_length_mm"] >= 53) end)
end

#select-penguins(penguins)

check:
  select-penguins(penguins) is 
  table: number, species, island, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g, sex, year
    row: 185, "Gentoo", "Biscoe", 59.6, 17, 230, 6050, "male", 2007
    row: 215, "Gentoo", "Biscoe", 54.3, 15.7, 231, 5650, "male", 2008
    row: 253, "Gentoo", "Biscoe", 55.9, 17, 228, 5600, "male", 2009
    row: 259, "Gentoo", "Biscoe", 53.4, 15.8, 219, 5500, "male", 2009
    row: 267, "Gentoo", "Biscoe", 55.1, 16, 230, 5850, "male", 2009
  end
end

#accumulation

fun avg-flipper-length(l :: List<Number>) -> Number:
  doc: ""
  var total = 0
  block:
    for each(n from l):
      total := total + n
    end
    total / l.length()
  end
end

check:
  penguins_3 = 
    table: number, species, island, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g, sex, year
      row: 41, "Adelie", "Dream", 40.8, 18.4, 195.0, 3900.0, "male", 2007
      row: 174, "Gentoo", "Biscoe", 46.5, 14.5, 213.0, 4400.0, "female", 2007
      row: 313, "Chinstrap", "Dream", 52.0, 20.7, 210.0, 4800.0, "male", 2008
  end
  avg-flipper-length(penguins_3.column("flipper_length_mm")) is 
  206
end