$(document).on 'ajax:success', '#createTicket',(xhr,date,status) ->
  location.reload()

$(document).on 'ajax:error', '#createTicket',(xhr,date,status) ->
  from = $('#new_ticket .modal-body')
  div = $('<div id="createTicketErrors" class="alert alert-danger"></div>')
  ul = $('<ul></ul>')
  date.responseJSON.messeges.forEach(messeage,i) ->
    li = $('<li></li>').text(message)
    ul.append(li)

  if $('#createTicketErrors')[0]
    $('#createTicketErrors').html(ul)
  else
    div.append(ul)
    form.prepend(div)
