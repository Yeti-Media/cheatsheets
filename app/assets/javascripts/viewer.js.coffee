# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


cheatsheetPosition = 0

imagePreloader = (image) ->
  heavyImage = new Image();
  heavyImage.src = image;

loadImage = (cs) ->
  image_tag = "<img src=\"#{cs.image.url}\" alt=\"#{cs.name}\" />"
  $('#carousel').html image_tag

loadContent = (cs) ->
  iframe_tag = "<iframe src=\"/cheatsheets/#{cs.id}\"  width=\"100%\" height=\"100%\" /></iframe>"
  $('#carousel').html iframe_tag

loadUrl = (cs) ->
  iframe_tag = "<iframe src=\"#{cs.url}\" width=\"100%\" height=\"100%\"/></iframe>"
  $('#carousel').html iframe_tag

loadCheatsheet = (cs) ->
  if cs.cheatsheet_type == 'content'
    loadContent cs
  else
    loadImage cs
  $(".active").removeClass 'active'
  $("#cs_#{cheatsheetPosition}").addClass 'active'



$(document).ready =>
  $("#cs_0").addClass 'active'
  imagePreloader cheatsheet.image.url for cheatsheet in cheatsheets when cheatsheet.cheatsheet_type isnt 'html'
  loadImage cheatsheets[0]
  $('.nav-prev').click =>
     if cheatsheetPosition isnt 0
       cheatsheetPosition--
       loadCheatsheet cheatsheets[cheatsheetPosition]
     return false

  $('.nav-next').click =>
     if cheatsheetPosition isnt cheatsheets.length - 1
       cheatsheetPosition++
       loadCheatsheet cheatsheets[cheatsheetPosition]

     return false


  $('.cs_nav_item').click (event)=>
    cheatsheetPosition =  parseInt($(event.target).attr('rel'))
    loadCheatsheet cheatsheets[cheatsheetPosition]

