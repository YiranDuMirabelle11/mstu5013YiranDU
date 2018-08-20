<guess>
  <div class="window model-content">
    <div class="modal-header">
      <h5 class="modal-title">So Your Guess!<h5>
    </div>
    <div class="modal-body">
      <p><span> { fakename } </span>is</p>
      <input type="text" value="" placeholder="Your guessing person" ref="guess">
    </div>

    <div class="modal-footer">
      <button type="button" class="btn btn-secondary" onclick={ close } > Close </button>
      <button type="button" class="btn btn-primary" onclick={ submit } > Submit </button>
    </div>
  </div>


  <script>
   var that= this;

   console.log("guess");
   this.fakename = this.opts.currentUser;
   var currentUserRef = database.ref("usersInfo/" + this.fakename);


   //Firebase
   currentUserRef.on('value', function(snap){
     var data = snap.val();
     that.trueanswer = data.realName;
   });

   this.close = function() {
     this.parent.guessing =false;
     this.parent.update();
     this.refs.guess.value = "";
   };

   this.submit = function() {
     console.log("Check for answer!");
     var guessName = this.refs.guess.value;
     console.log(guessName, this.trueanswer);
     if (guessName == this.trueanswer) {
       alert("You get your classmate right!");
     } else {
       alert("Try Again");
     };
   };



  </script>

  <style>
    :scope {
      background-color: white;
      position:fixed;
      border: 1.5px solid #73AD21;
      border-radius: 3px;
      bottom: 50%;
      left: 35%;
      width: 35%;
    }

    .window {
      padding: 20px 20px 20px 20px;
    }

    .btn-secondary {
      background-color: #6C747D;
      color: white;
    }

    input {
      width: 100%
    }

    h5 {
      font-size: 150%;
    }

    span {
      color: #765F77;
      font-family: 'Gloria Hallelujah', cursive;
    }
  </style>

</guess>
