$(document).ready ->
  button = $("#start-button") || $("#question_form")
  button.on("ajax:success", (e, data, status, xhr) ->
    $("#poll-container").empty()
    $("#poll-container").append xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#poll-container").empty()
    $("#poll-container").append "<p>Что-то пошло не так...</p>"

