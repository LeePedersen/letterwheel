App.global_chat = App.cable.subscriptions.create {
  channel: 'ConversationsChannel'
  conversation_id: ''
},
connected: ->

disconnected: ->

recieved: (data) ->

send_message: (message, conversation_id) ->
  @perform 'send_message', message: message, conversation_id: conversation_id
