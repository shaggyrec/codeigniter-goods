<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>Магазин CodeIgniter Goods</title>
	<link rel="stylesheet" href="/static/css/st.css"/>
</head>
<body>
<div class="container">
	<header>
		<div class="logo">goods</div>
	</header>
	<hr/>
	<main>
		<h1>Магазин товаров</h1>
		<div class="products">
			<?php foreach ($products as $product):?>
				<div class="products__container">
					<section class="products__item">
						<?php if($product['image'] !== null):?>
							<div class="products__images">
								<?php foreach ($product['image']  as $image):?>
									<div class="products__image" style="background-image: url('/static/img/<?php echo $image;?>')">
									</div>
								<?endforeach;?>
							</div>
						<?php endif;?>
						<div class="products__body">
							<h3 class="products__name"><?php echo $product['name'];?></h3>
							<div class="products__prices">
								<?php foreach ($product['prices'] as $price):?>
									<div class="products__price products__price--<?php echo $price->type;?>">
										<?php echo $price->value;?> р
									</div>
								<?php endforeach;?>
							</div>
							<p><?php echo $product['description'];?></p>
							<div class="products__category">Категория: <?php echo $product['section']?></div>
						</div>
					</section>
				</div>
			<?php endforeach;?>
		</div>
	</main>
	<footer>
		<div class="container">
			<hr/>
			&copy; goods 2019
		</div>
	</footer>
</div>
</body>
</html>
