let $header := "itemCategory,classname"
return (
  $header,
  for $x in doc("expansion_types.xml")/types/type
  where $x/min >= 1
  order by $x/category/@name
  return
    string-join((
        data($x/category/@name),
        data($x/@name)
    ), ",")
)
