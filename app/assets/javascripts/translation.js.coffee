$(document).ready ->
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