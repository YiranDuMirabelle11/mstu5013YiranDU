<app>
  <!-- This is the main tag -->
  <div if={ !loggedin && !digging } class="loginpage">
    <div class="loginwelcome">
      <h1>Hello!</h1>
      <div class="logininfo">
        <span> Log in as <input type="text" value="" placeholder="nickname: e.g.apple" ref="nickname" class="nicknameinput" onkeypress={ login }></span>
        <br><ion-icon name="arrow-round-forward" onclick={ login } class="icon"></ion-icon>
      </div>
    </div>
  </div>


  <!-- Logged In Page -->
  <div class="mainpage" show={ loggedin && !digging }>
    <div class="welcome">
      <span class="welcometext">  Hello, <span class="username"> {user} </span>!</span>
      <ion-icon name="log-out" onclick={ logout } class="icon iconlogout"></ion-icon>
    </div>

    <div class="filtergroup">
      <select class="filter" ref="filtertag" onchange={ tagfilter }>
        <option value="">TAG</option>
        <option value="activity">activity</option>
        <option value="funpost">funpost</option>
        <option value="academic">academic</option>
      </select>
    </div>

    <message each={ messagesList }></message>

    <post if={ posting } class="animated fadeInUp"></post>

    <button type="button" class="center composebtn" onclick={ compose }> Compose </button>

  </div>


  <individual if={ digging } user={ diguser }></individual>
  <guess show={ guessing } class ="animated fadeInUp"></guess>

  <script>
    var that = this;

    // Initualize
    this.loggedin = false;
    this.user = null;
    this.guessing = false;
    this.posting = false;
    this.digging = false;
    this.diguser = "";
    this.messagesList = [];

    // Firebase setup
    var messagesRef = database.ref("messages");

    messagesRef.on('value', function(snap) {
      var data = snap.val();
      that.messagesTotalList = [];
      for (message in data) {
        that.messagesTotalList.push(data[message])
      };
      that.messagesList = that.messagesTotalList;
      console.log(that.messagesList);
    });

    // this.googleauth = function() {
    //   var provider = new firebase.auth.GoogleAuthProvider();
    //   firebase.auth().signInWithPopup(provider).catch(function(err){
    //     console.log(error);
    //   });
    // }

    //Login Page
    this.login = function(e) {
      if ((event.type === "keypress" && event.which === 13) || event.type === "click") {
        if (this.refs.nickname.value == "") {
          alert("Please type in the nickname");
          return false;
        }
        this.user = this.refs.nickname.value;
        this.loggedin = true;
      }
    };

    //Log out
    this.logout = function() {
      this.loggedin = false;
      this.posting = false;
      this.user = "";
      alert("You have logged out successfully!");
    };

    // Filter Messages
    this.tagfilter = function() {
      var topic = that.refs.filtertag.value;
      if (topic !== "") {
        var messageTopicPath = "messagesByTopic/" + topic;
        var messageTopicRef = database.ref(messageTopicPath);
        messageTopicRef.once('value', function(snap) {
          var data = snap.val();
          var topicMessages = Object.values(data);
          console.log(topicMessages);
          that.messagesList = topicMessages;
          that.update();
        });
        // that.messageList = topicMessages;
      } else {
        that.messagesList = that.messagesTotalList;
      };
    };

    // Compose button
    this.compose = function() {
      that.posting = true;
    };

    // Cancel post
    this.cancel = function() {
      that.posting = false;
      that.update();
    };
  </script>


  <style>
    :scope {
      display: block;
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
      margin-top: 10px;
    }

    .mainpage {
      margin-bottom: 50px;
      margin-left: 30px;
      margin-right: 30px;
    }

    .welcometext {
      font-size: 200%;
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

    .loginpage {
      background-color: #8DC8E8;
      margin: 0 0 0 0;
      padding-bottom:350px;
     }

    .filtergroup {

     }

    .filter {
      font-size: 90%;
      margin-right: 0px;
     }

  </style>




</app>
