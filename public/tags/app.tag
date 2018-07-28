<app>
  <!-- This is the main tag -->
  <div>  Hello <span class = "username"> {user} </span>!</div>
  <message each={ messagesList } ></message>

  <post if= { posting }></post>

  <button type="button" class = "center" onclick = { compose }>Compose</button>
  <guess show={ guessing }></guess>


  <script>
  var that = this;
  this.user = "apple";
  this.guessing = false;
  var messagesRef = database.ref("messages");
  messagesRef.on('value', function(snap) {
    var data = snap.val();
    that.messagesList = [];
    for (message in data) {
      that.messagesList.push(data[message])
    };
    that.update();
  });

    this.posting = false;
    console.log("ready")


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
  }

   .username {
     margin-right: 10px;
     color: blue;
     font-size: 150%;
   }


  </style>




</app>
