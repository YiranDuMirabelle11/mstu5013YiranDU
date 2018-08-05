<message>
  <div class="tag-{ tag }" ref = "text">
    <div class="text row">
      <div class="user col-sm-1" >
       <span onclick={ dig }> {user} </span>
      </div>
      <div class="row">
        <p> <ion-icon name="finger-print" class="icon" if={ tag=="funpost"}></ion-icon><ion-icon name="wine" class = "icon" if={ tag=="activity" }></ion-icon><ion-icon name="book" class = "icon" if={ tag=="academic" }></ion-icon> {content} </p>
      </div>
    </div>



 <script>
  var that = this;

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

 </style>

</message>
