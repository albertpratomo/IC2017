<?php 
include "../connect.php";
if(isset($_POST['showdata'])){
	$result = mysqli_query($con, "SELECT * from desain");
	echo '

	<div class="container">
		<div class="col-sm-3 col-sm-6" style="margin-top:10px">
			<div class="circle-tile" >
				<a href="#">
					<div class="circle-tile-heading red" >
						<img src="image/cake.png" width="115px" heigth="115px">
					</div>
				</a>
				<div class="circle-tile-content red">';

					$row= mysqli_fetch_row($result);
					echo'
					<div class="circle-tile-description text-faded" style="font-size:15">
						'.$row[1].'
					</div>
					<div class="circle-tile-number text-faded" style="font-size:18">
						USD '.$row[3].' &nbsp|&nbsp    
						IDR '.$row[2].'
					</div>
					<div class="circle-tile-number text-faded" style="font-size:18">
						RMB '.$row[4].'
					</div>


				</div>
			</div>
		</div>

		<div class="col-sm-3 col-sm-6" style="margin-top:10px">
			<div class="circle-tile" >
				<a href="#">
					<div class="circle-tile-heading blue" >
						<img src="image/cake.png" width="115px" heigth="115px">
					</div>
				</a>
				<div class="circle-tile-content blue">';

					$row= mysqli_fetch_row($result);
					echo'
					<div class="circle-tile-description text-faded" style="font-size:15">
						'.$row[1].'
					</div>
					<div class="circle-tile-number text-faded" style="font-size:18">
						USD '.$row[3].' &nbsp|&nbsp    
						IDR '.$row[2].'
					</div>
					<div class="circle-tile-number text-faded" style="font-size:18">
						RMB '.$row[4].'
					</div>


				</div>
			</div>
		</div>

		<div class="col-sm-3 col-sm-6" style="margin-top:10px">
			<div class="circle-tile" >
				<a href="#">
					<div class="circle-tile-heading green">
						<img src="image/turkey.png" width="120px" heigth="120px">
					</div>
				</a>
				<div class="circle-tile-content green">';

					$row= mysqli_fetch_row($result);
					echo'
					<div class="circle-tile-description text-faded" style="font-size:15">
						'.$row[1].'
					</div>
					<div class="circle-tile-number text-faded" style="font-size:18">
						USD '.$row[3].' &nbsp|&nbsp    
						IDR '.$row[2].'
					</div>
					<div class="circle-tile-number text-faded" style="font-size:18">
						RMB '.$row[4].'
					</div>


				</div>
			</div>
		</div>

		<div class="col-sm-3 col-sm-6" style="margin-top:10px">
			<div class="circle-tile" >
				<a href="#">
					<div class="circle-tile-heading orange">
						<img src="image/glass.png" width="110px" heigth="110px" style="margin-top:10px">
					</div>
				</a>
				<div class="circle-tile-content orange">';

					$row= mysqli_fetch_row($result);
					echo'
					<div class="circle-tile-description text-faded" style="font-size:15">
						'.$row[1].'
					</div>
					<div class="circle-tile-number text-faded" style="font-size:18">
						USD '.$row[3].' &nbsp|&nbsp    
						IDR '.$row[2].'
					</div>
					<div class="circle-tile-number text-faded" style="font-size:18">
						RMB '.$row[4].'
					</div>

				</div>
			</div>
		</div>

		<div class="col-sm-3 col-sm-6" style="margin-top:5px">
			<div class="circle-tile" >
				<a href="#">
					<div class="circle-tile-heading red">
						<img src="image/chocolate.png" width="110px" heigth="110px" style="margin-top:10px">
					</div>
				</a>
				<div class="circle-tile-content red">';

					$row= mysqli_fetch_row($result);
					echo'
					<div class="circle-tile-description text-faded" style="font-size:15">
						'.$row[1].'
					</div>
					<div class="circle-tile-number text-faded" style="font-size:18">
						USD '.$row[3].' &nbsp|&nbsp    
						IDR '.$row[2].'
					</div>
					<div class="circle-tile-number text-faded" style="font-size:18">
						RMB '.$row[4].'
					</div>

				</div>
			</div>
		</div>

		<div class="col-sm-3 col-sm-6" style="margin-top:5px">
			<div class="circle-tile" >
				<a href="#">
					<div class="circle-tile-heading blue">
						<img src="image/cupcake.png" width="120px" heigth="120px">
					</div>
				</a>
				<div class="circle-tile-content blue">';

					$row= mysqli_fetch_row($result);
					echo'
					<div class="circle-tile-description text-faded" style="font-size:15">
						'.$row[1].'
					</div>
					<div class="circle-tile-number text-faded" style="font-size:18">
						USD '.$row[3].' &nbsp|&nbsp    
						IDR '.$row[2].'
					</div>
					<div class="circle-tile-number text-faded" style="font-size:18">
						RMB '.$row[4].'
					</div>


				</div>
			</div>
		</div>

		<div class="col-sm-3 col-sm-6" style="margin-top:5px">
			<div class="circle-tile" >
				<a href="#">
					<div class="circle-tile-heading green">
						<img src="image/sandwich.png" width="120px" heigth="120px">
					</div>
				</a>
				<div class="circle-tile-content green">';
					$row= mysqli_fetch_row($result);
					echo'
					<div class="circle-tile-description text-faded" style="font-size:15">
						'.$row[1].'
					</div>
					<div class="circle-tile-number text-faded" style="font-size:18">
						USD '.$row[3].' &nbsp|&nbsp    
						IDR '.$row[2].'
					</div>
					<div class="circle-tile-number text-faded" style="font-size:18">
						RMB '.$row[4].'
					</div>


				</div>
			</div>
		</div>

		<div class="col-sm-3 col-sm-6" style="margin-top:5px">
			<div class="circle-tile" >
				<a href="#">
					<div class="circle-tile-heading orange">
						<img src="image/salad.png" width="120px" heigth="120px">
					</div>
				</a>
				<div class="circle-tile-content orange">';
					$row= mysqli_fetch_row($result);
					echo'
					<div class="circle-tile-description text-faded" style="font-size:15">
						'.$row[1].'
					</div>
					<div class="circle-tile-number text-faded" style="font-size:18">
						USD '.$row[3].' &nbsp|&nbsp    
						IDR '.$row[2].'
					</div>
					<div class="circle-tile-number text-faded" style="font-size:18">
						RMB '.$row[4].'
					</div>


				</div>
			</div>
		</div>
	</div>



	';
	exit();

}

?>