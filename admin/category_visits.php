<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <?php include 'includes/navbar.php'; ?>
  <?php include 'includes/menubar.php'; ?>

  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        Categorías Más Visitadas
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
        <li class="active">Categorías Más Visitadas</li>
      </ol>
    </section>

    <section class="content">
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Detalle de Categorías</h3>
        </div>
        <div class="box-body">
          <?php
            $stmt = $conn->prepare("SELECT c.name, v.visit_count FROM category_visits v LEFT JOIN category c ON c.id = v.category_id ORDER BY v.visit_count DESC");
            $stmt->execute();
            $categories = array();
            $visits = array();
            while ($row = $stmt->fetch()) {
                array_push($categories, $row['name']);
                array_push($visits, $row['visit_count']);
            }
            $categories = json_encode($categories);
            $visits = json_encode($visits);
          ?>
          <canvas id="barChartCategoryVisits" style="height:250px"></canvas>
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
  var ctx = document.getElementById('barChartCategoryVisits').getContext('2d');
  var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: <?php echo $categories; ?>,
      datasets: [{
        label: 'Visitas',
        data: <?php echo $visits; ?>,
        backgroundColor: 'rgba(60,141,188,0.9)',
        borderColor: 'rgba(60,141,188,0.8)',
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
