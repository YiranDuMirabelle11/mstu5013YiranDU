<message>
    <div class="tag-{ tag }" ref="text">
      <div class="text row">
        <div class="user col-sm-1" if={ user }>
         <span onclick={ dig }> {user} </span>
        </div>
        <div class="content">
          <p> <ion-icon name="finger-print" class="icon" if={ tag=="funpost"}></ion-icon><ion-icon name="wine" class = "icon" if={ tag=="activity" }></ion-icon><ion-icon name="book" class = "icon" if={ tag=="academic" }></ion-icon> {content} </p>
        </div>
        <div show={ owner } class="editform" id="edit">
          <span class="editspan" onclick={ edit }> Edit </span>
          <span class="editspan" onclick={ delete }> Delete </span>
        </div>

      </div>





 <script>
  var that = this;
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
  };

  this.delete = function(e) {
    var message = event.item;
    console.log(message.id);
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

 </style>

</message>
