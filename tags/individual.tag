<individual>
  <h1 onclick={ guess }>{ user }</h1>


  <script>
    this.user = this.opts.user;

    this.guess = function() {
      var userfakename = this.user;
      observable.trigger('guessactive', userfakename);
      this.parent.guessing = true;
      this.parent.update();
    };

    // <canvas id="myChart"></canvas>


    console.log(this.opts.user);
  </script>

  <style>
    :scope {
     padding: 10px 10px 10px 10px;
    }


  </style>

</individual>
