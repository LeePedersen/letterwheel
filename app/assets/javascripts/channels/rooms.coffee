jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')
  if $('#messages').length > 0

    App.global_chat = App.cable.subscriptions.create {
      channel: 'ConversationsChannel'
      conversation_id: messages.data('conversation-id')
    },
    connected: ->

    disconnected: ->

    recieved: (data) ->
      messages.append data['message']

    send_message: (message, conversation_id) ->
      @perform 'send_message', message: message, conversation_id: conversation_id

    $('#new_message').submit(event) ->
      console.log('reached the thing')
      $this = $(this)
      textarea = $this.find('#message_body')
      if $.trim(textarea.val()).length > 1
        App.global_chat.send_message textarea.val(), messages.data('conversation-id')
        textarea.val('')
      event.preventDefault()
      return false
