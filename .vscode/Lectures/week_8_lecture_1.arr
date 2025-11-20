use context starter2024

data TaxonomyTree:
    node(rank :: String, name :: String, children :: List<TaxonomyTree>)
end

#Example: part of the cat family
lion = node("Species", "Panthera leo", [list: ])
tiger = node("Species", "Panthera tigris", [list: ])
leopard = node("Species", "Panthera pardus", [list: ])
panthera = node("Genus", "Panthera", [list: lion, tiger, leopard])

house-cat = node("Species", "Felis catus", [list: ])
wildcat = node("Species", "Felis silvestris", [list: ])
felis = node("Genus", "Felis", [list: house-cat, wildcat])

felidae = node("Family", "Felidae", [list: panthera, felis])

fun is-leaf(t :: TaxonomyTree) -> Boolean:
  is-empty(t.children)
where:
  is-leaf(house-cat) is true
  is-leaf(felis) is false
end

fun count-nodes(t :: TaxonomyTree) -> Number:
  1 + count-nodes-children(t.children)
where:
  count-nodes(lion) is 1
  count-nodes(panthera) is 4
  count-nodes(felis) is 3
  count-nodes(felidae) is 8
end

fun count-nodes-children(c :: List<TaxonomyTree>) -> Number:
  cases (List) c:
    | empty => 0
    | link(first, rest) =>
      count-nodes(first) + count-nodes-children(rest)
  end
end

fun count-leaves(t :: TaxonomyTree) -> Number:
  cases (List) t.children:
    | empty => 1 #this node is a leaf
    | else => count-leaves-children(t.children)
  end
end

fun count-leaves-children(c :: List<TaxonomyTree>) -> Number:
  cases (List) c:
    | empty => 0
    | link(first, rest) => count-leaves(first) + count-leaves-children(rest)
  end
end

fun count-species(t :: TaxonomyTree) -> Number:
  (if t.rank == "Species":
    1 
  else:
    0
    end) + count-species-children(t.children)
  
where:
  count-species(house-cat) is 1
  count-species(panthera) is 3
end

fun count-species-children(c :: List<TaxonomyTree>) -> Number:
  cases (List) c:
    | empty => 0
    | link(first, rest) =>
      count-species(first) + count-species-children(rest)
  end
end

fun count-rank(t :: TaxonomyTree, r :: String) -> Number:
  (if t.rank == r:
     1
   else:
     0
    end) + count-rank-children(t.children, r)
where:
  count-rank(panthera, "Species") is 3
  count-rank(panthera, "Genus") is 1
  count-rank(felidae, "Genus") is 2
end

fun count-rank-children(c :: List<TaxonomyTree>, r :: String) -> Number:
  cases (List) c:
    | empty => 0
    | link(first, rest) =>
      count-rank(first, r) + count-rank-children(rest, r)
  end
end

fun taxon-height(t :: TaxonomyTree) -> Number:
  cases (List) t.children:
    | empty => 1
    | else => 1 + taxon-height-children(t.children)
  end
where:
  taxon-height(felidae) is 3
  taxon-height(house-cat) is 1
  taxon-height(felis) is 2
end

fun taxon-height-children(c :: List<TaxonomyTree>) -> Number:
  cases (List) c:
    | empty => 0
    | link(first, rest) => num-max(taxon-height(first), taxon-height-children(rest))
  end
end

fun all-names(t :: TaxonomyTree) -> List<String>:
  append([list: t.name], all-names-list(t.children)) 
  
where:
  all-names(lion) is [list: "Panthera leo"]
  all-names(panthera) is [list: "Panthera", "Panthera leo", "Panthera tigris", "Panthera pardus"]
end

fun all-names-list(c :: List<TaxonomyTree>) -> List<String>:
  cases (List) c:
  | empty => empty
  | link(first, rest) => append(all-names(first), all-names-list(rest))
  end
end