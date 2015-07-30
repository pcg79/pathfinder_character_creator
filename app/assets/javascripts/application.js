// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

//= require bootstrap.min

var delay = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout (timer);
    timer = setTimeout(callback, ms);
  };
})();

var updateCount = function(cardType, action, statusClass) {
  console.log('cardType', cardType);
  console.log('action', action);
  console.log('statusClass', statusClass);

  var $countTr = $('div#current-counts tr#' + cardType);
  var $countTd = $('td.count', $countTr);
  var count = parseInt($countTd.html());
  var newCount;

  if (action == "add")
    newCount = count + 1;
  else
    newCount = count - 1;

  $countTd.html(newCount);

  $countTr.removeClass().addClass(statusClass);
};
