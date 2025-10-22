use context dcic2024

dummy-list = [list : 1,2,3,4]

dummy-list

dummy-list.first

dummy-list-1 = dummy-list.rest
dummy-list-2 = dummy-list-1.rest
dummy-list-2.first

check:
  [list:        ] is empty
  [list: 1      ] is link(1, empty)
  [list: 1, 2   ] is link(1, link(2, empty))
  [list: 1, 2, 3] is link(1, link(2, link(3, empty)))
end

[list: 7,8,9,10,11,12].length()

fun my-len(l):
  cases (List) l:
    | empty => 0
    | link(f, r) => 1 + my-len(r)
  end
where:
  my-len([list: 7,8,9]) is 3
  my-len([list:   8,9]) is 2
  my-len([list:     9]) is 1
  my-len([list:      ]) is 0
  
  my-len([list: 55,56,57,58]) is 2 + my-len([list: 56,57,48].rest)
  my-len([list: 55,56,57,58]) is 1 + my-len([list: 55,56,57,58].rest)
  
end

#function to find maximum value
fun find-max(l):
  cases (List) l:
    | empty => -999999
    | link(f, r) => num-max(f, find-max(r))
  end
where:
  find-max([list: 3,5,7,9,1]) is 9
  find-max([list: ]) is -999999
end

fun my-double(l):
  cases (List) l:
    | empty => empty
    | link(f, r) => link(f * 2, my-double(r))
  end
where:
  my-double([list: 3,5,2]) is [list: 6,10,4]
end


fun string-concat(l):
  cases (List) l:
    | empty => ""
    | link(f, r) => f + string-concat(r)
  end
where:
  string-concat([list: "hello", "!"]) is "hello!"
  string-concat([list:             ]) is ""
end

fun string-upper(l):
  cases (List) l:
    | empty => ""
    | link(f, r) => string-to-upper(f) + string-upper(r)
  end
where:
  string-upper([list: "hello", " ", "world", "!"]) is "HELLO WORLD!"
  string-upper([list:             ]) is ""
end

fun round-numbers(l :: List<Number>) -> List<Number>:
  doc: "Rounds each decimal number in a list to the nearest integer"
  
  cases(List) l:
    | empty => empty
    | link(f, r) => link(num-round(f), round-numbers(r))
  end
  
where:
  round-numbers([list: 2.6, 3.4, 9.2]) is [list: 3, 3, 9]
end
  