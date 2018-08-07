<individual>
  <h1 onclick={ guess }>{ user }</h1>
  <div class="chart">
      <canvas id="myPieChart"></canvas>
  </div>



  <script>
    this.user = this.opts.user;

    this.guess = function() {
      var userfakename = this.user;
      observable.trigger('guessactive', userfakename);
      this.parent.guessing = true;
      this.parent.update();
    };

    this.on('mount', function() {
      console.log("graphs");
      var ctx = document.getElementById("myPieChart");
      var myPieChart = new Chart(ctx,{
          type: 'doughnut',
          data: {
            datasets: [{
                data: [10, 20, 30],
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





  </style>

</individual>
