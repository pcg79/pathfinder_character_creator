# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('div').on 'dblclick', 'a.list-group-item', (event) ->
  event.preventDefault

  card = $(this)

  $.post card.attr('href'), card_id: card.data('card-id')

  false


$('div').on 'click', 'a.list-group-item', (event) ->
  event.preventDefault
  false

$('input#card-list-filter').on 'keyup', (event) ->
  $this = $(this)

  delay ->
    console.log "$this", $this
    console.log "$this.val", $this.val()

    $.get $this.data('filter-path'), q: $this.val(), (data) ->
      $('div#all-cards .list-group').html(data)

  , 250
