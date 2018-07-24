<message >
  <div class={ activity: (tag == 3), funpost:(tag == 2), academic:(tag == 1)} ref = "text">
    <div class="text">
      <p> {user} </p>
      <p> {content} </p>
    </div>
  </div>


 <script>





 </script>


 <style>
   :scope {
     display: block;
     background-color: #B7B5E4;
     border-radius: 5px;
     margin: 10px;
     padding: 10px 10px 10px 10px;
   }

   .activity {
     border: 1px solid black;
   }

   .funpost {
     border: 1px solid green;
   }

  .academic {
    border: 1px solid red;
  }

  .text {
    padding: 10px 10px 10px 10px;
  }
 </style>

</message>
