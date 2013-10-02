
//= require handlebars

do -> Array::shuffle ?= ->
  for i in [@length-1..1]
    j = Math.floor Math.random() * (i + 1)
    [@[i], @[j]] = [@[j], @[i]]
  @

$ ->

  if ($billboard = $('#billboard')).length
    do ->
      source = $('#billboard-template').html()
      template = Handlebars.compile(source)
    
      billboard = window.billboards[Math.floor(Math.random() * window.billboards.length)]
      $billboard.html template(billboard)
  
  if ($headliners = $('#headliners')).length
    do ->
      source = $('#callout-template').html()
      template = Handlebars.compile(source)
      
      rowed_headliners = []
      
      headliners = window.headliners.shuffle()[0...8][..]
      while headliners.length
        rowed_headliners.push headliners[0...4]
        headliners = headliners[4..]

      $headliners.html template(rowed_headliners)