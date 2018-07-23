<app>
  <!-- This is the main tag -->
  <div>  Hello <span class = "userinfo"> {user} </span> </div>
  <message each={ messagesList } ></message>

  <post if= { posting }></post>

  <button type="button" name="button" onclick = { compose }>Compose</button>

  <script>
  var that = this;
  this.user = "Pear";
  this.messagesList = [{
      user: "apple",
      content: "I want a tutor",
      tag: 1
    },{
      user: "apple",
      content: "I come from Iraq",
      tag: 2
    },{
      user: "apple",
      content: "I want to hang out",
      tag: 3
    },{
      user: "apple",
      content: "I want to go to the cruise",
      tag: 3
    }];

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

   .userinfo {
     margin-right: 10px;
   }

  </style>




</app>
