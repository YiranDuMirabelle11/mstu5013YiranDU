<post>

 <div class="postingarea">
   <textarea name="name" rows="8" cols="48" placeholder="Content" ref = "text"></textarea>
   <div class="types">
     <select ref = "tag">
       <option value="1">academic</option>
       <option value="2">funpost</option>
       <option value="3">activity</option>
     </select>
   </div>
   <br>
   <button type="button" onclick= { post } >Post</button>
   <button type="button" onclick = { parent.cancel } >Cancel</button>
 </div>

 <script>
   console.log("post");
   var that = this;

   this.post = function(e) {
     var postmessage = {
       user: that.parent.user,
       content: this.refs.text.value,
       tag: this.refs.tag.value
     }
     that.parent.messagesList.push(postmessage);
     that.parent.posting = false;
     that.parent.update();
   }
 </script>

 <style>
  :scope {
   display: block;
   border: 1px solid black;
   padding: 10px;
   position: fixed;
   right: 100px;
   bottom: 30px;
   width: 400px;
   height: 300px;
   background-color: tomato;
   }
   
   textarea {
     margin-top: 10px;
   }

   input {
     width: 95%;
   }

 </style>



</post>
