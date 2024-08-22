<?php
session_start();
include("../../db.php");// Update the path as necessary
error_reporting(E_ALL); // It's generally good to see all errors during development
include "sidenav.php";
include "topheader.php";

// Handle product deletion
if(isset($_GET['action']) && $_GET['action'] == 'delete' && isset($_GET['product_id'])) {
    $product_id = mysqli_real_escape_string($con, $_GET['product_id']);

    // Fetch image for deletion
    $result = mysqli_query($con, "SELECT product_image FROM products WHERE product_id='$product_id'");
    if($result) {
        $row = mysqli_fetch_assoc($result);
        $path = "../product_images/" . $row['product_image'];
        if(file_exists($path)) {
            unlink($path);
        }
        mysqli_query($con, "DELETE FROM products WHERE product_id='$product_id'");
    }
}

// Pagination Setup
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$limit = 12; // Products per page
$start = ($page - 1) * $limit;

// Fetch Products
$query = "SELECT product_id, product_image, product_title, product_price FROM products LIMIT $start, $limit";
$result = mysqli_query($con, $query);

// Calculate total pages
$total_results = mysqli_num_rows(mysqli_query($con, "SELECT product_id FROM products"));
$total_pages = ceil($total_results / $limit);
?>
<div class="content">
    <div class="container-fluid">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header card-header-primary">
                    <h4 class="card-title">Products List</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive ps">
                        <table class="table tablesorter" id="page1">
                            <thead class="text-primary">
                                <tr><th>Image</th><th>Name</th><th>Price</th><th>Action</th></tr>
                            </thead>
                            <tbody>
                                <?php while($row = mysqli_fetch_assoc($result)): ?>
                                <tr>
                                    <td><img src="../../product_images/<?= $row['product_image']; ?>" style="width:50px; height:50px;"></td>
                                    <td><?= $row['product_title']; ?></td>
                                    <td><?= $row['product_price']; ?></td>
                                    <td>
                                        <a class="btn btn-success" href="?product_id=<?= $row['product_id']; ?>&action=delete">Delete</a>
                                    </td>
                                </tr>
                                <?php endwhile; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <?php for($i = 1; $i <= $total_pages; $i++): ?>
                    <li class="page-item"><a class="page-link" href="?page=<?= $i; ?>"><?= $i; ?></a></li>
                    <?php endfor; ?>
                </ul>
            </nav>
        </div>
    </div>
</div>
<?php include "footer.php"; ?>
