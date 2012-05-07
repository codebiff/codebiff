# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("#post_published").click ->
    if $(this).attr('checked')
      $("#published_at").children("select").removeAttr("disabled")
    else
      $("#published_at").children("select").attr("disabled", true)