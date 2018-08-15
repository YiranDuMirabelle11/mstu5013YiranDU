<message>
  <div class="">
    <div class="tag-{ tag }" ref="text">
      <div class="text row">
        <div class="user col-sm-1" if={ user }>
         <span onclick={ dig }> {user} </span>
        </div>
        <div class="content">
          <div class="editarea" show={ editing }>
            <textarea ref="edittext"></textarea>
            <br>
            <button type="button" class = "btn cancel" onclick={ canceledit }>Cancel</button>
            <button type="button"class = "btn post" onclick={ editpost }>Post</button>
          </div>
          <p show={ !editing }> <ion-icon name="finger-print" class="icon" if={ tag=="funpost"}></ion-icon><ion-icon name="wine" class = "icon" if={ tag=="activity" }></ion-icon><ion-icon name="book" class = "icon" if={ tag=="academic" }></ion-icon> {content} </p>
        </div>
        <div show={ owner && !editing } class="editform" id="edit">
          <span class="editspan" onclick={ edit }> Edit </span>
          <span class="editspan" onclick={ delete }> Delete </span>
        </div>
      </div>
   </div>
  </div>





 <script>
  var that = this;
  this.editing = false;
  this.on('update', function() {
    if (this.parent.user === this.user) {
        that.owner = true;
      } else {
        that.owner = false;
      };
      // console.log(that.owner);
      // console.log(this.parent.user);
      // console.log(this.user);
  });


  this.edit = function(e) {
    var message = event.item;
    this.editing =true;
    that.refs.edittext.value = this.content;
  };

  this.canceledit = function() {
    this.editing = false;
  }

  this.delete = function(e) {
    var message = event.item;
    console.log(message.id);
    var messagePath = "messages/" + message.id;
    var messagesByTopicPath = "messagesByTopic/" + message.tag + "/" + message.id;
    var messagesByUserPath = "messagesByUser/" + message.user + "/" + message.id;
    var updates = {};
    updates[messagePath] = null;
    updates[messagesByTopicPath] = null;
    updates[messagesByUserPath] = null;
    database.ref().update(updates);
    this.parent.update();
  };

  this.editpost = function(e) {
    var message = event.item;
    var messagePath = "messages/" + message.id + "/content";
    var messagesByTopicPath = "messagesByTopic/" + message.tag + "/" + message.id + "/content";
    var messagesByUserPath = "messagesByUser/" + message.user + "/" + message.id + "/content";
    var updates = {};
    var newContent = that.refs.edittext.value;
    console.log(newContent);
    updates[messagePath] = newContent;
    updates[messagesByTopicPath] = newContent;
    updates[messagesByUserPath] = newContent;
    database.ref().update(updates);
    that.editing = false;
    // that.parent.update();
  };

  this.dig = function() {
    this.parent.digging = true;
    this.parent.diguser = this.user;
    this.parent.update();
  };


 </script>


 <style>
   :scope {
     display: block;
     border-radius: 5px;
     padding-top: 10px;
     padding-bottom: 10px;
    }

    .tag-activity {
     border: 2.5px solid #93E2D0;
    }

    .tag-funpost {
     border: 2.5px solid #8DC8E8;
    }

    .tag-academic {
    border: 2.5px solid #D4C5E2;
    }

    .text {
    padding: 10px 10px 10px 10px;
    }

   .user {
    background-color: #FFD43A;
    margin-right: 8px;
    padding-left: 10px;
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

    .user :hover {
      font-weight: 1000;
      text-decoration: underline;
    }

    .content {
      margin-bottom: 20px;
    }

    .editspan {
      font-size: 80%;
      margin-right: 20px;
    }

    .text:hover #edit {
      display:block;
      margin-top: -20px;
    }

    .text #edit {
      display: none;
      width: 250px;
      height: 20px;
    }

    #edit {
      margin-left: 20px;
      opacity: 0.7;
    }

    .editarea {
      width: 100%;
      margin-bottom: -25px;
      margin-left: 8%;
      margin-top: 10px;
    }

    textarea {
      width: 85%;
      height: 70%;
    }

    .btn {
      padding: 3px 5px;
      margin-right: 20px;
    }

    .cancel {
      background-color: #6C747D;
      color: white;
      border-color: none;
    }

    .post {
      background-color: #3379B7;
      color: white;
      border-color: none;
    }

 </style>

</message>
