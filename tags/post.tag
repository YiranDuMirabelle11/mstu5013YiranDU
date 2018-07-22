<post>

 <div class="postingarea">
   <textarea name="name" rows="8" cols="48" placeholder="Content"></textarea>
   <div class="types">
     <select>
       <option value="1">academic</option>
       <option value="2">funpost</option>
       <option value="3">activity</option>
     </select>
   </div>
   <br>
   <button type="button">Post</button>
   <button type="button" onclick = { parent.cancel } >Cancel</button>
 </div>

 <script>
   console.log("post")
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
   }
   textarea {
     margin-top: 10px;
   }

   input {
     width: 95%;
   }

 </style>



</post>
