<post>

 <div class="postingarea">
   <textarea name="name" rows="6" cols="32" placeholder="Content" ref="text"></textarea>
   <div class="types">
     <select ref="tag">
       <option value="1">academic</option>
       <option value="2">funpost</option>
       <option value="3">activity</option>
     </select>
   </div>
   <div class="buttons">
     <button type="button" onclick={ post } class = "post button">Post</button>
     <button type="button" onclick={ parent.cancel } class = "cancel button">Cancel</button>
   </div>

 </div>

 <script>
   console.log("post");
   var that = this;

   this.post = function(e) {
     var postmessage = {
       user: that.parent.user,
       content: this.refs.text.value,
       tag: this.refs.tag.value
     };
     if (this.refs.text.value === "") {
       alert("Please type in your message content!");
       e.preventUpdate = true;
       return false;
     }
       var messagesRef = database.ref('/messages');
       var newkey = messagesRef.push().key;

       var messagesPath = "messages/" + newkey;
       var messagesByTopicPath = "messagesByTopic/" + this.refs.tag.value + "/" + newkey;
       var updates = {};
       updates[messagesPath] = postmessage;
       updates[messagesByTopicPath] = postmessage;

       database.ref().update(updates);
       that.parent.posting = false;
       that.parent.update();
   }
 </script>

 <style>
  :scope {
   display: block;
   border: 1px solid #765F77;
   border-radius: 3px;
   padding: 10px;
   position: fixed;
   right: 60px;
   bottom: 40px;
   width: 300px;
   height: 230px;
   background-color: #FFD43A;
   box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
   font-size: 90%;
   }

   textarea {
     margin-top: 5px;
     margin-bottom: 8px;
   }

   input {
     width: 95%;
   }

   .buttons {
     margin-top: 8px;
   }

   .cancel {
     background-color: #6C747D;
     color: white;
     border-color: none;
   }

   .post {
     background-color: #3379B7;
     color: white;
     border-color: none;
   }

   .button {
     border-radius: 5px;
     padding: 3px 8px 3px 8px;
     margin-right: 5px;
   }


 </style>



</post>
