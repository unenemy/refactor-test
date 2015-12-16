$(document).ready ->
  $('.story-rating').rating
    filled: 'fa fa-star fa-lg'
    empty: 'fa fa-star-o fa-lg'
    start: 0
    stop: 5

  $('.translate').change (e) ->
    select = $(@)
    $.ajax
      url: select.data('path')
      method: 'POST'
      data:
        translate_to: select.val()
      success: (data) ->
        select.closest('.panel').find('.story-title').html(data.title)
        select.closest('.panel').find('.story-content').html(data.content)