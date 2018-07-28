<message >
  <div class={ activity: (tag == 3), funpost:(tag == 2), academic:(tag == 1)} ref = "text">
    <div class="text row">
      <div class="user col-sm-1" onclick={ guess }>
       <span> {user} </span>
      </div>
      <p> {content} </p>
    </div>



 <script>
  var that = this;
  this.guess = function() {
    var userfakename = this.user;
    console.log(userfakename);
    observable.trigger('guessactive', userfakename);
    this.parent.guessing = true;
    this.parent.update();
  };





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

   .user {
    background-color: yellow;
    margin-right: 8px;3
    }

    p {
      margin-left: 8px;
      margin-right: 8px;
    }
 </style>

</message>
