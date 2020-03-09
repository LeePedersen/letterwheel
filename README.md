# Messaging thing (name pending inspiration)
_Messaging site/app? with ruby on rails, using end-to-end encryption_

## PLANNING

### SECURITY STUFF DONE
  * create controllers, models for conversations, messages
  * bcrypt
  * validations:
    * password and password confirmation
    * email format
    * username presence and uniqueness
    * message body, conversation_id and user_id presence
  * protect_from_forgery: helps prevent CRSF attacks
  * authorizations:
    * check that user is signed in
    * check that user is in conversation

### GENERAL TODO
  * email verification
  * maybe get actioncable up and running
  * deploy to heroku

### SECURITY TODO
  * end2end stuff
  * add pepper?

### LINKS
  * https://secushare.org/end2end#header
  * implementation of end-to-end with rails and virgil: https://github.com/cbetta/virgil-rails-chat/tree/after/app/views
  * guide to general encryption with rails: https://qiita.com/alokrawat050/items/ff6dceec32baa0c8fa57
  * tool to test rails security: https://brakemanscanner.org/
  * more encryption with rails: https://pawelurbanek.com/rails-secure-encrypt-decrypt
  * tool to validate strong password: https://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html
  * more resources for end-to-end with ruby: https://github.com/topics/end-to-end-encryption?l=ruby
  * https://developer.virgilsecurity.com/docs/e3kit/get-started/quickstart/
  * https://github.com/VirgilSecurity/demo-backend-nodejs
  * resource for CORS issues: https://medium.com/@Nicholson85/handling-cors-issues-in-your-rails-api-120dfbcb8a24

### NOTES 3/6
  * trying to get example chat app up and running so I can see how it works. Having config issues with cmake gem
  * starting to think I may need to do this just as a chat between two people to start off - will figure out how that'll work a little later
  * Config issues were with virgil gem which is kinda what my whole thing is based on. Got them sorted out on my computer but not on epicodus computer
  * Giving up on config issues on epicodus computer right now. If I can get it deployed it shouldn't be a problem? I think?
  * Got the virgil example chat repo up and running! Shouldn't have been this hard but there were a lot of config issues
  * Troubleshooting the example chat CORS headers. May not spend too much time on this because I have a feeling it might be a version issue and it seems more productive to cross that bridge in my own app when I get to it
  * Next steps: ActionCable could be really good to have, and then I have to study the virgil security docs more to figure out how to make it work

### NOTES 3/9
  * might need to specify url in cable.yml
  * turbolinks?? Do I have it? Do I need it?
