use context starter2024

data River:
  | merge(width :: Number, left :: River, right :: River)
  | stream(flow-rate :: Number)
end

stream-a = stream(5)
stream-b = stream(3)
stream-c = stream(8)

merge-1 = merge(12, stream-a, stream-b)
main-river = merge(15, merge-1, stream-c)

fun total-flow(r :: River) -> Number:
  cases (River) r:
    | merge(width, left, right) => total-flow(left) + total-flow(right)
    | stream(flow) => flow
  end
where:
  total-flow(stream-a) is 5
  total-flow(main-river) is 16
end

fun count-merges(r :: River) -> Number:
  cases (River) r:
    | merge(width, left, right) => 1 + count-merges(left) + count-merges(right)
    | stream(flow) => 0
  end
where:
  count-merges(stream-a) is 0
  count-merges(main-river) is 2
end
      

fun count-streams(r :: River) -> Number:
  cases (River) r:
    | merge(width, left, right) => count-streams(left) + count-streams(right)
    | stream(flow) => 1
  end
where:
  count-streams(stream-a) is 1
  count-streams(main-river) is 3
end

fun max-width(r :: River) -> Number:
  cases (River) r:
    | merge(width, left, right) => num-max(width, max-width(left))
    | stream(flow) => 0
  end
where:
  max-width(main-river) is 15
  max-width(merge-1) is 12
end

fun widen-river(r :: River, n :: Number) -> River:
  cases (River) r:
    | merge(width, left, right) => merge(n + r.width, left, right)
    | stream(flow) => 0
  end
where:
  widen-river(merge-1, 2) is merge(14, stream-a, stream-b)
  widen-river(main-river, 3) is merge(18, merge-1, stream-c)
end

fun cap-flow(r :: River, n :: Number) -> River:
  cases (River) r:
    | merge(width, left, right) => merge(width, cap-flow(left, n), cap-flow(right, n))
    | stream(flow) => 
      block:
      var f = 0
      if flow >= n:
        f := n
      else:
        f := flow
      end
      stream(f)
      end
  end
where:
  cap-flow(stream-c, 7) is stream(7)
  cap-flow(stream-b, 8) is stream(3)
  cap-flow(merge-1, 4) is merge(12, stream(4), stream(3))
end

fun has-large-stream(r :: River) -> Boolean:
  cases(River) r:
    | merge(width, left, right) => has-large-stream(left) or has-large-stream(right)
    | stream(flow) => flow > 5
  end
where:
  has-large-stream(merge-1) is false
  has-large-stream(main-river) is true
  has-large-stream(stream-b) is false
end
  