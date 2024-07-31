<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <?php include 'includes/navbar.php'; ?>
  <?php include 'includes/menubar.php'; ?>

  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        Productos Más Vistos
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
        <li class="active">Productos Más Vistos</li>
      </ol>
    </section>

    <section class="content">
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Detalle de Productos</h3>
        </div>
        <div class="box-body">
          <?php
            $stmt = $conn->prepare("SELECT p.name, SUM(v.view_count) as total_views FROM product_views v LEFT JOIN products p ON p.id = v.product_id GROUP BY v.product_id ORDER BY total_views DESC");
            $stmt->execute();
            $products = array();
            $views = array();
            while ($row = $stmt->fetch()) {
                array_push($products, $row['name']);
                array_push($views, $row['total_views']);
            }

            $products = json_encode($products);
            $views = json_encode($views);
          ?>
          <canvas id="barChartProductViews" style="height:250px"></canvas>
        </div>
      </div>
    </section>
  </div>

  <?php include 'includes/footer.php'; ?>
</div>
<!-- ./wrapper -->

<?php include 'includes/scripts.php'; ?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<script>
$(function(){
  var ctx = document.getElementById('barChartProductViews').getContext('2d');
  var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: <?php echo $products; ?>,
      datasets: [{
        label: 'Vistas',
        data: <?php echo $views; ?>,
        backgroundColor: 'rgba(255,159,64,0.9)',
        borderColor: 'rgba(255,159,64,0.8)',
        borderWidth: 1
      }]
    },
    options: {
      responsive: true,
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      }
    }
  });
});
</script>
</body>
</html>
