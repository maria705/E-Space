<?php
include "db.php";
include "header.php";
?>

<section class="section">
    <div class="container-fluid">
        <?php
        if (isset($_GET['error']) && $_GET['error'] === 'true') {
            echo '<div class="alert alert-danger">Error occurred while placing the order. Please try again.</div>';
        }
        ?>
        <!-- Your content here -->
    </div>
</section>

<?php
include "footer.php";
?>