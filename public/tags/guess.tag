<guess>
  <div class="window model-content">
    <div class="modal-header">
      <h5 class="modal-title">So Your Guess!<h5>
    </div>
    <div class="modal-body">
      <p><span> { fakename } </span>is</p>
      <input type="text" value="" placeholder = "Your guessing person">
    </div>

    <div class="modal-footer">
      <button type="button" class="btn btn-secondary" onclick = { close } > Close </button>
      <button type="button" class="btn btn-primary" onclick = { submit } > Submit </button>
    </div>
  </div>


  <script>
   var that= this;
   this.fakename = "Who";

   this.close = function() {
     this.parent.guessing =false;
     this.parent.update();
   };

   this.submit = function() {
     console.log("Check for answer!");
   }

   observable.on('guessactive', function(userfakename) {
     that.fakename = userfakename;
     that.update();
   });



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
