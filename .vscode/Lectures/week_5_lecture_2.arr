use context dcic2024
include csv
include data-source
#import following two libraries
#math
import math as M
#statistics
import statistics as S

cafe-data = 
  table: day, drinks-sold
    row: "Mon", 45
    row: "Tue", 30
    row: "Wed", 55
    row: "Thu", 40
    row: "Fri", 60
  end



sample-list = [list: 4,5,3,2,6,7]
sample-list

empty-list = [list: ]
empty-list


sales = cafe-data.get-column("drinks-sold")
#perform following computations
#max
M.max(sales)
#min
M.min(sales)
#mean
S.mean(sales)
#sum
M.sum(sales)

#multiply all numbers together ; for example, the output of [list: 2,3,4] is 24
fun compute-product(num-list :: List<Number>) -> Number block:
  doc: "multiply all numbers in a list together"
  var result = 1
  for each(n from num-list):
    result := result * n
    end
  result
where: 
  compute-product([list: 2,3,4]) is 24
end



discount-codes = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]
discount-codes

unique-codes = distinct(discount-codes)
unique-codes

fun is-real-code(code :: String) -> Boolean:
  not(string-to-lower(code) == "none")
end

real-codes = filter(is-real-code, unique-codes)
first-code = real-codes.get(0)
first-code

upper-codes = map(string-to-upper, real-codes)
upper-codes

survey-responses = [list: "yes", "NO", "maybe", "Yes", "no", "Maybe"]

unique-responses = distinct(survey-responses)
upper-responses = map(string-to-upper, unique-responses)
# not in pyret is <> not !=
definitive-responses = filter(lam(o): o <> "MAYBE" end, upper-responses)
definitive-responses

fun sum-even-numbers(num-list :: List<Number>) -> Number:
  block:
    var total = 0
    for each(n from num-list):
      if num-modulo(n, 2) == 0:
        total := total + n
      else:
        total
      end
    end
    total
  end
end

random-list = [list: 1,2,3,4]
sum-even-numbers(random-list)
     
fun my-length(num-list :: List<Number>) -> Number:
  num-list.length()
end

my-length(random-list)

fun my-doubles(num-list :: List<Number>) -> List<Number> block:
    doc: "doubles each element of list and returns as new list"
    var doubles = [list: ]
  for each(n from num-list):
      doubles := doubles.append([list: n * 2])
    end
    doubles
where:
  my-doubles([list: 1, 2, 3]) is [list: 2, 4, 6]
end
    
my-doubles-map = map(lam(n): n * 2 end, random-list)
my-doubles-map

fun my-string-lens(string-list :: List<String>) -> List<Number> block:
  doc: "converts a string list to a num list of the length of each string"
  var elements = [list: ]
  for each(s from string-list):
    elements := elements.append([list: string-length(s)])
  end
  elements
end

new-list = [list: "hi", "world", "yes"]
my-string-lens(new-list)

my-string-lens-map = map(lam(s) : string-length(s) end, new-list)
my-string-lens-map

fun my-alternating(string-list :: List<String>) -> List<String>:
  doc: "returns a new list with alternating elements"
  block:
  var alternating-list = [list: ]
  var current = 0
  for each(s from string-list):
      block:
        if num-modulo(current, 2) == 0:
      alternating-list := alternating-list.append([list: s])
    else:
      alternating-list
    end
    current := current + 1
  end
    end
  alternating-list
end
end

my-alternating(new-list)

