# Messaging thing (name pending inspiration)
_Messaging site/app? with ruby on rails, using end-to-end encryption_

## PLANNING

### SECURITY STUFF DONE
  * create controllers, models for conversations, messages
  * add bcrypt
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
  * default page: sign in page
  * views
  * email verification
  * add uuid

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

### NOTES
  * trying to get example chat app up and running so I can see how it works. Having config issues with cmake gem
  * starting to think I may need to do this just between two people to start off - will figure out how that'll work a little later
  * Config issues were with virgil gem which is kinda what my whole thing is based on. Got them sorted out on my computer but not on epicodus computer
  * Giving up on config issues on epicodus computer right now. If I can get it deployed it shouldn't be a problem? I think?
