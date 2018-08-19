<app>
  <!-- This is the main tag -->
  <div if={ !loggedin && !digging } class="loginpage">
      <!-- This is the fakename -->
    <div class="loginwelcome">
      <h1>Hello!</h1>
      <div class="logininfo" if={ !user }>
        <span> Log in as <input type="text" placeholder="nickname: e.g.apple" ref="nickname" class="nicknameinput" onkeypress={ loginFakeName }></span>
        <br><ion-icon name="arrow-round-forward" onclick={ loginFakeName } class="icon"></ion-icon>
      </div>
    <!-- This is the second login -->
      <div if={ user } class="animated fadeInLeft">
        <!-- This is the realname -->
        <div class="logininfo" if={ !userLogged }>
          <div class="marginTop">
            <span>Your Real First Name<input type="text" placeholder="e.g. Nancy" ref="newRealName" class="nicknameinput"></span>
          </div>
          <div class="marginTop">
            <span>Create Password<input type="text" placeholder="e.g. 123456" ref="newPassword" class="nicknameinput"></span>
          </div>
          <ion-icon name="arrow-round-forward" onclick={ creatNewUser } class="icon"></ion-icon>
        </div>
          <!-- This is the password -->
        <div class="logininfo" if={ userLogged }>
          <span>Password:<input type="text" ref="password" class="nicknameinput"></span>
          <br><ion-icon name="arrow-round-forward" onclick={ pastUserlogin } class="icon"></ion-icon>
        </div>
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
    });

    var usersInfo = database.ref("usersInfo");
    usersInfo.on('value', function(snap) {
      var data = snap.val();
      that.usersList = [];
      for (user in data) {
        that.usersList.push(data[user])
      };
    });

    //Login First
    this.loginFakeName = function(e) {
      if ((event.type === "keypress" && event.which === 13) || event.type === "click") {
        if (this.refs.nickname.value == "") {
          alert("Please type in the nickname");
          return false;
        }
        that.user = this.refs.nickname.value;
        that.userLogged = this.usersList.filter(obj => obj.fakeName === that.user);
        if (that.userLogged == "") {
          that.userLogged = false;
        } else {
          console.log(that.userLogged[0].password);
        };
      };
    };

    //Creat New user
    this.creatNewUser = function(e) {
      if ((event.type === "keypress" && event.which === 13) || event.type === "click") {
        if (this.refs.newRealName.value == "") {
          alert("Please type in your FIRST NAME");
          return false;
        };
        if (this.refs.newPassword.value == "") {
          alert("Please type in the PASSWORD");
          return false;
        };
        var newRealName = this.refs.newRealName.value;
        var newPassword = this.refs.newPassword.value;
        var newUser = {
          fakeName: this.user,
          realname: newRealName,
          password: newPassword
        };
        database.ref("usersInfo/" + this.user).set(newUser);
        this.loggedin = true;
      };
    };

    //Past User Login
    this.pastUserlogin = function() {
      if ((event.type === "keypress" && event.which === 13) || event.type === "click") {
        var truePassword = that.userLogged[0].password;
        var password = this.refs.password.value;
        if (truePassword == password) {
          this.loggedin = true;
        } else {
          alert("Please try again");
        };
      };
    };


    //Log out
    this.logout = function() {
      this.loggedin = false;
      this.posting = false;
      this.user = "";
      alert("You have logged out successfully!");
    };

    //Filter Messages
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

    .marginTop {
      margin-top: 5px;
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
      margin-top: 5px;
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
