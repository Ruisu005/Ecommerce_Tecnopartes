<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <?php include 'includes/navbar.php'; ?>
  <?php include 'includes/menubar.php'; ?>

  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        Recomendaciones de Productos
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
        <li class="active">Recomendaciones</li>
      </ol>
    </section>

    <section class="content">
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Productos Recomendados</h3>
        </div>
        <div class="box-body">
          <?php
            $stmt = $conn->prepare("SELECT p.name, p.price FROM product_recommendations r LEFT JOIN products p ON p.id = r.product_id ORDER BY r.recommended_at DESC");
            $stmt->execute();
            echo "<table class='table table-bordered'>";
            echo "<tr><th>Producto</th><th>Precio</th></tr>";
            while ($row = $stmt->fetch()) {
                echo "<tr><td>".$row['name']."</td><td>".$row['price']."</td></tr>";
            }
            echo "</table>";
          ?>
        </div>
      </div>
    </section>
  </div>

  <?php include 'includes/footer.php'; ?>
</div>
<!-- ./wrapper -->

<?php include 'includes/scripts.php'; ?>
</body>
</html>
