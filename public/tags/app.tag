<app>
  <!-- This is the main tag -->
  <div if= { !loggedin }>
    <div class="loginwelcome">
      <h1>Hello!</h1>
      <div class=" logininfo">
        <span> Log in as <input type="text" value="" placeholder="nickname: e.g.apple" ref = "nickname" class = "nicknameinput"></span>
        <br><ion-icon name="arrow-round-forward" onclick = { login } class = "icon"></ion-icon>
      </div>

    </div>

  </div>


  <!-- Logged In Page -->
  <div if={ loggedin }>
    <div class="rows">
      <span class = "welcome">  Hello, <span class = "username"> {user} </span>!
    </span>
      <ion-icon name="log-out" onclick = { logout } class = "icon iconlogout"></ion-icon>
    </div>

    <message each={ messagesList } ></message>

    <post if= { posting } class="animated fadeInUp"></post>

    <button type="button" class = "center composebtn" onclick = { compose }> Compose </button>
    <guess show={ guessing } class ="animated fadeInUp"></guess>
  </div>



  <script>
    var that = this;
    this.loggedin = false;
    this.user = "";
    this.guessing = false;
    this.posting = false;

    this.login = function() {
      if (this.refs.nickname.value == "") {
        alert("Please type in the nickname");
        return false;
      }
      this.user = this.refs.nickname.value;
      this.loggedin = true;
    };

    this.logout = function() {
      this.loggedin = false;
      this.user = "";
    };


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

  .loginwelcome {
    text-align:center;
    padding-top: 300px;
  }

  h1 {
    margin-bottom: 30px;
    font-size: 200%;
  }

  .welcome {
    font-size: 200%;
    margin-left: 5px;
  }

  .nicknameinput {
    margin-left:10px;
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

   .icon {
     /* background-color: #C9D7F8; */
     font-size: 150%;
     margin-top: 10px;
     padding: 3px 3px 3px 3px;
   }

   .iconlogout {
     position: fixed;
     right: 10px;
     top: 5px;
   }

   .logininfo {
     text-align: center;
     margin: auto;
     width: auto;
     height: 50%;
     padding: 10px;
   }

  </style>




</app>
