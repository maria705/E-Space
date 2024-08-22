<?php
session_start();
include("../../db.php");

if(isset($_POST['btn_save']))
{
    $product_name=$_POST['product_name'];
    $details=$_POST['details'];
    $price=$_POST['price'];
    $c_price=$_POST['c_price'];
    $product_type=$_POST['product_type'];
    $brand=$_POST['brand'];
    $tags=$_POST['tags'];

    //picture coding
    $picture_name=$_FILES['picture']['name'];
    $picture_type=$_FILES['picture']['type'];
    $picture_tmp_name=$_FILES['picture']['tmp_name'];
    $picture_size=$_FILES['picture']['size'];

    if($picture_type=="image/jpeg" || $picture_type=="image/jpg" || $picture_type=="image/png" || $picture_type=="image/gif")
    {
        if($picture_size<=50000000)
        {
            $pic_name=$picture_name;
            move_uploaded_file($picture_tmp_name,"../../product_images/".$pic_name);

            $query = "INSERT INTO products (product_cat, product_brand, product_title, product_price, product_desc, product_image, product_keywords) VALUES ('$product_type', '$brand', '$product_name', '$price', '$details', '$pic_name', '$tags')";

            if (mysqli_query($con, $query)) {
                $success_message = "Product added successfully!";
            } else {
                $error_message = "Error: " . mysqli_error($con);
            }
        } else {
            $error_message = "Image size is too large. Maximum allowed size is 50MB.";
        }
    } else {
        $error_message = "Invalid image format. Only JPG, JPEG, PNG, and GIF formats are allowed.";
    }

    mysqli_close($con);
}

include "sidenav.php";
include "topheader.php";
?>
      <!-- End Navbar -->
      <div class="content">
        <div class="container-fluid">
          <form action="" method="post" type="form" name="form" enctype="multipart/form-data">
          <div class="row">
          
                
         <div class="col-md-7">
            <div class="card">
              <div class="card-header card-header-primary">
                <h5 class="title">Add Product</h5>
              </div>
              <div class="card-body">
              <?php
                            if (isset($success_message)) {
                                echo "<div class='alert alert-success'>" . $success_message . "</div>";
                            } elseif (isset($error_message)) {
                                echo "<div class='alert alert-danger'>" . $error_message . "</div>";
                            }
                            ?>
                  <div class="row">
                    
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>Product Title</label>
                        <input type="text" id="product_name" required name="product_name" class="form-control">
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="">
                        <label for="">Add Image</label>
                        <input type="file" name="picture" required class="btn btn-fill btn-success" id="picture" >
                      </div>
                    </div>
                     <div class="col-md-12">
                      <div class="form-group">
                        <label>Description</label>
                        <textarea rows="4" cols="80" id="details" required name="details" class="form-control"></textarea>
                      </div>
                    </div>
                  
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>Pricing</label>
                        <input type="text" id="price" name="price" required class="form-control" >
                      </div>
                    </div>
                  </div>
                 
                  
                
              </div>
              
            </div>
          </div>
          <div class="col-md-5">
            <div class="card">
              <div class="card-header card-header-primary">
                <h5 class="title">Categories</h5>
              </div>
              <div class="card-body">
                
                  <div class="row">
                    
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>Product Category</label>
                        <input type="number" id="product_type" name="product_type" required="[1-6]" class="form-control">
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="">Product Brand</label>
                        <input type="number" id="brand" name="brand" required class="form-control">
                      </div>
                    </div>
                     
                  
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>Product Keywords</label>
                        <input type="text" id="tags" name="tags" required class="form-control" >
                      </div>
                    </div>
                  </div>
                
              </div>
              <div class="card-footer">
                  <button type="submit" id="btn_save" name="btn_save" required class="btn btn-fill btn-primary">Update Product</button>
              </div>
            </div>
          </div>
          
        </div>
         </form>
          
        </div>
      </div>
      <?php
include "footer.php";
?>