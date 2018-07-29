<app>
  <!-- This is the main tag -->
  <div class = "welcome">  Hello, <span class = "username"> {user} </span>!
  </div>

  <message each={ messagesList } ></message>

  <post if= { posting } class="animated fadeInUp"></post>

  <button type="button" class = "center composebtn" onclick = { compose }> Compose </button>
  <guess show={ guessing } class ="animated fadeInUp"></guess>


  <script>
    var that = this;
    this.user = "apple";
    this.guessing = false;
    this.posting = false;

    var messagesRef = database.ref("messages");

    messagesRef.on('value', function(snap) {
      var data = snap.val();
      that.messagesList = [];
      for (message in data) {
        that.messagesList.push(data[message])
      };
      that.update();
    });


    this.compose = function() {
      that.posting = true;
    }

    this.cancel = function() {
      that.posting = false;
      that.update();
    }
  </script>


  <style>
  :scope {
    display: block;
    margin: 10px 10px 10px 10px;
    color: #765F77;
    font-size: 120%
  }

  .welcome {
    font-size: 200%;
  }

  .username {
     color: #93E2D0;
   }

   .composebtn {
     border-radius: 5px;
     padding: 3px 8px 3px 8px;
     margin-right: 5px;
     background-color: #3379B7;
     color: white;
     border-color: none;
     margin-left:48%;
   }
  </style>




</app>
