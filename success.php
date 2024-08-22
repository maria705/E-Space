<?php
include "db.php";
include "header.php";
?>

<section class="section">
    <div class="container-fluid">
        <?php
        if (isset($_GET['success']) && $_GET['success'] === 'true') {
            echo '<div class="alert alert-success">Order placed successfully!</div>';
        }
        ?>
        <!-- Your content here -->
    </div>
</section>

<?php
include "footer.php";
?>