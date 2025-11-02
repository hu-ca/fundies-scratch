use context starter2024

fun my-pos-nums(l):
  cases (List) l:
    | empty => empty
    | link(f, r) => 
      if f > 0:
        link(f, my-pos-nums(r))
      else:
        my-pos-nums(r)
      end
  end
where:
  # link
  my-pos-nums([list: 1, -2, 3, -4]) is link(1, my-pos-nums([list: -2, 3, -4]))
  my-pos-nums([list:        3, -4]) is link(3, my-pos-nums([list:        -4]))

# rest
  my-pos-nums([list:    -2, 3, -4]) is         my-pos-nums([list:     3, -4])
  my-pos-nums([list:           -4]) is         my-pos-nums([list:          ])
end

fun my-alternating(l):
  cases (List) l:
    | empty => empty
    | link(f, r) =>
      cases (List) r:
        | empty => [list: f]
        | link(fr, rr) => link(f, my-alternating(rr))
      end
  end
where:
  my-alternating([list: 1,2,3,4,5,6]) is [list: 1,3,5]
end

fun my-max(l):
  cases (List) l:
    | empty => raise("not defined for empty lists")
    | link(f, r) => 
      cases (List) r:
        | empty => f
        | else => num-max(f, my-max(r))
      end
  end
where:
  my-max([list: 2,1,4,3,2]) is 4
end

fun my-rs(acc, l):
  cases (List) l:
    | empty => empty
    | link(f,r) => new-sum = acc + f
      link(new-sum, my-rs(new-sum,r))
  end
end

fun my-running-sum(l):
  my-rs(0,l)
where:
  my-running-sum([list: 1, 2, 3, 4, 5]) is [list: 1, 3, 6, 10, 15]
end

fun my-r(rev-list :: List, l :: List) -> List:
  cases (List) l:
    | empty => rev-list
    | link(f,r) => my-r(link(f, rev-list), r)
  end
end

fun my-rev(l):
  my-r(empty, l)
where:
  my-rev([list: 1,2,3,4]) is [list: 4,3,2,1]
end

fun more-than-five(l :: List<String>) -> List:
  cases (List) l:
    | empty => empty
    | link(f,r) => 
      if string-length(f) > 5:
        link(f, more-than-five(r))
      else:
        more-than-five(r)
      end
  end
where:
  
end

        