<individual>
  <div class="container">
    <h1 onclick={ guess }>{ user }</h1>
    <div class="row info">
      <!-- Chart -->
      <div class="col-md-6">
          <canvas ref="myPieChart"></canvas>
      </div>
      <!-- Message List -->
      <div class="col-md-6 usermessages">
       <message each={ currentUserMessages }></message>
      </div>
    </div>

    <div class="mainpage">
      <span class="" onclick={ mainpage }>Main Page</span>
    </div>
  </div>




  <script>
    var that = this;
    this.user = this.opts.user;
      var messagesOfTargetUserRef = database.ref("messagesByUser/"+this.user);
     // messagesOfTargetUserRef.orderByChild('tag').equalTo('academic').once('value', function(snap) {
     //                    var data = snap.val();
     //                    this.numOfAcademic Object.keys(data).length;
     //                  });
     // messagesOfTargetUserRef.orderByChild('tag').equalTo('activity').once('value', function(snap) {
     //                    var data = snap.val();
     //                    this.numOfActivity = Object.keys(data).length;
     //                  });

    this.guess = function() {
      var userfakename = this.user;
      observable.trigger('guessactive', userfakename);
      this.parent.guessing = true;
      this.parent.update();
    };

    this.on('update', function() {
      console.log("graphs");
      var ctx = this.refs.myPieChart;
      messagesOfTargetUserRef.orderByChild('tag').equalTo('funpost').on('value', function(snap){
        var data = snap.val();
        that.numOfFunpost = Object.keys(data).length;
        });
      messagesOfTargetUserRef.orderByChild('tag').equalTo('academic').on('value', function(snap){
        var data = snap.val();
        that.numOfAcademic = Object.keys(data).length;
        });
      messagesOfTargetUserRef.orderByChild('tag').equalTo('activity').on('value', function(snap){
        var data = snap.val();
        that.numOfActivity = Object.keys(data).length;
        });
      var userdata = [that.numOfAcademic, that.numOfFunpost, that.numOfActivity];
      var myPieChart = new Chart(ctx,{
          type: 'doughnut',
          data: {
            datasets: [{
                data: userdata,
                backgroundColor: [
                  'rgba(255, 99, 132, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(255, 206, 86, 0.2)'
                ],
            }],

            // These labels appear in the legend and in the tooltips when hovering different arcs
            labels: [
                'academic',
                'fun post',
                'activity'
            ]
          },

                // These labels appear in the legend and in the tooltips when hovering different arcs
          options: {}
        });
      });


      this.mainpage = function() {
        console.log("Go back to the main page");
        this.parent.digging = false;
        this.parent.update();
      };

      messagesOfTargetUserRef.on('value', function(snap) {
        var data = snap.val();
        that.currentUserMessages = [];
        for (message in data) {
          that.currentUserMessages.push(data[message])
        };
        console.log(that.currentUserMessages);
        that.update();
      });


    console.log(this.opts.user);
  </script>

  <style>
    :scope {
     display: block;
     margin: 20px 20px;
    }

    .chart {
      width: 50%;
    }

    .mainpage {
      text-align: center;
      margin-top: 30px;
      font-size: 80%;
    }

    .usermessages {

      overflow-y: scroll;
      height: 100%;
    }

    .info {
      height: 90%;
    }

    h1 {
      overflow: hidden;
    }

    h1:after {
      content:"Guess Who I am";
      margin-left: 20px;
      position: relative;
      opacity: 0;
      top: -20px;
      -webkit-transition: all 0.5s;
      transition: all 0.5s;
      font-size: 60%;
    }

    h1:hover:after {
      opacity: 0.7;
      top: 0px;
    }

    span:hover {
      color: black;
    }




  </style>

</individual>
