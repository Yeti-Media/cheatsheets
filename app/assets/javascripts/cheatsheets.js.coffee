# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready () =>
  $(".cheatsheet_type").hide()
  $("##{$('#cheatsheet_type').val()}_type").show()
  $('#cheatsheet_type').change =>
    value = $('#cheatsheet_type').val()
    dom_to_show = "##{value}_type"
    $(".cheatsheet_type").hide()
    $(dom_to_show).show()
    return true

