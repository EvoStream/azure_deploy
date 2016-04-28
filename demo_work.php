<html>
  <!-- Demo to load the CPU for a number of seconds -->
  <head><title>CPU load demo</title></head>
  <body>
    <br/><br/>
    <center>
      <h1>CPU load demo</h1>
      <br/><br/>
      <?php
        error_reporting(E_NONE);
        $num = $_GET["num"];
        echo "$num seconds\n";
        set_time_limit($num);
        for ($x = 0; $x <= $num * 1000; $x++)
        {
          $x = tan(M_LNPI + log(ceil(M_PI * M_LNPI + 100))); 
        }
      ?>
      <h1>Completed</h1>
    </center>
  </body>
</html>
