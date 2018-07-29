<message >
  <div class={ activity: (tag == 3), funpost:(tag == 2), academic:(tag == 1)} ref = "text">
    <div class="text row">
      <div class="user col-sm-1" >
       <span onclick={ guess }> {user} </span>
      </div>
      <div class="row">
        <p> <ion-icon name="finger-print" class = "icon" if = {tag == 2}></ion-icon><ion-icon name="wine" class = "icon" if={ tag == 3 }></ion-icon><ion-icon name="book" class = "icon" if={ tag == 1 }></ion-icon> {content} </p>
      </div>
    </div>



 <script>
  var that = this;

  this.guess = function() {
    var userfakename = this.user;
    observable.trigger('guessactive', userfakename);
    this.parent.guessing = true;
    this.parent.update();
  };


 </script>


 <style>
   :scope {
     display: block;
     border-radius: 5px;
     margin: 10px;
     padding: 10px 10px 10px 10px;
    }

    .activity {
     border: 2.5px solid #93E2D0;
    }

    .funpost {
     border: 2.5px solid #8DC8E8;
    }

    .academic {
    border: 2.5px solid #D4C5E2;
    }

    .text {
    padding: 10px 10px 10px 10px;
    }

   .user {
    background-color: #FFD43A;
    margin-right: 8px;
    padding-top: 3px;
    padding-bottom: 3px;
    border-radius: 1px;
    }

    p {
      margin-left: 25px;
      margin-right: 8px;
      margin-top: 5px;
    }

    .icon {
      font-size: 120%;
    }

 </style>

</message>