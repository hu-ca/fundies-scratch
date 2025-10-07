use context dcic2024

include csv
include data-source

voter-data =
  load-table: VoterID,DOB,Party,Address,City,County,Postcode
  source: csv-table-file("voters.csv", default-options)
end

voter-data

filter-with(voter-data, lam(r): r["Party"] == "Labour" end).length()
# 5

fun blank-to-undecided(s :: String) -> String:
  doc: "replaces an empty string with Undecided"
  if s == "":
    "Undecided"
  else: 
    s
  end
where:
  blank-to-undecided("") is "Undecided"
  blank-to-undecided("blah") is "blah"
end

undecided-voters = transform-column(voter-data, "Party", blank-to-undecided)

#freq-bar-chart(undecided-voters, "Party")

fun normalize-date(s :: String) -> String:
  year = string-substring(s, 6, string-length(s))
  month = string-substring(s, 3, 5)
  day = string-substring(s, 0, 2)
  year + "-" + month + "-" + day
end

transform-column(voter-data, "DOB", normalize-date)

fun normalize-postcode(s :: String) -> String:
  block:
    last-3-chars = string-substring(s, (string-length(s) - 3), string-length(s))
    first-chars = string-substring(s, 0, (string-length(s) - 3))
    new-s = first-chars + " " + last-3-chars
    string-to-upper(new-s)
  end
end

transform-column(voter-data, "Postcode", normalize-postcode)