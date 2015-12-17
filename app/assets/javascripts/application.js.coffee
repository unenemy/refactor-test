#= require jquery
#= require jquery_ujs
#= require translation
#= require turbolinks
#= require bootstrap
#= require_tree .

$(document).ready ->
  $('.story-rating').rating
    filled: 'fa fa-star fa-lg'
    empty: 'fa fa-star-o fa-lg'
    start: 0
    stop: 5