jQuery ->
  $("#q").autocomplete(
    source: "/searches/autocomplete",
    minLength: 2
  )
