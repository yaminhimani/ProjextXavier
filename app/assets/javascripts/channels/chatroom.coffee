App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    #alert String(data.receiver_id)
    $(document).ready ->
      elem = $(".tabular>.item.active").first().attr('id')
      if elem?
        active_tab_id = $(".tabular>.item.active").first().attr('id').replace("admin_", "").replace("guest_or_user_", "")
        logged_user_id = $("#message_sender_id").val()
        #if logged user is the sender, and if the correct tab is opened, append message to the tab
        if String(active_tab_id) == String(data.receiver_id) and String(logged_user_id) == String(data.sender_id)
          $('#message-container').append data.mod_message
          scroll_bottom();
        if String(active_tab_id) == String(data.sender_id) and String(logged_user_id) == String(data.receiver_id)
          $('#message-container').append data.mod_message
          scroll_bottom();
        if String(active_tab_id) != String(data.receiver_id) and String(logged_user_id) == String(data.sender_id)  
          window.location = window.location        
      else 
        window.location = window.location
