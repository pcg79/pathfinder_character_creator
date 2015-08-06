# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('div').on 'click', 'a.list-group-item', (event) ->
  event.preventDefault
  false


$('div').on 'dblclick', 'a.list-group-item', (event) ->
  event.preventDefault

  $card = $(this)

  $.post $card.attr('href'), card_id: $card.data('card-id'), (data) ->
    if $card.data('action') == "remove"
      $card.remove()

      $deck_list = $('div#deck-cards div.list-group');

      if $deck_list.children().size() == 0
        $deck_list.append('<p>This list is empty.  Add some cards!</p>');

  false


$('input#card-list-filter').on 'keyup', (event) ->
  $this = $(this)

  delay ->
    $.get $this.data('filter-path'), q: $this.val(), (data) ->
      $('div#all-cards .list-group').html(data)

  , 250

$('div#default-deck').on 'click', 'a.btn', (event) ->
  answer = confirm('This will replace all cards in your deck.  Is that OK?')

  if !answer
    event.preventDefault
    false
