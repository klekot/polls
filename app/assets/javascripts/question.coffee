executeQuery = ->
  $.ajax
    method: 'post',
    url: '/countdown'
    data: "remain": $.countdown.periodsToSeconds($('.time').countdown('getTimes'))
    success: (data) ->
      remain = $.countdown.periodsToSeconds($('.time').countdown('getTimes'))
      if(remain <= 0)
        window.location = "/resume"
      return
  setTimeout executeQuery, 1000
  return

$(document).ready ->
  $('#start-button').click ->
    setTimeout executeQuery, 1000
    return
  return
