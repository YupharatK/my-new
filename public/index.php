<?php
require_once __DIR__ . '/../vendor/autoload.php';

use MyApp\Greeter;

$greeter = new Greeter();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My PHP App on Render</title>
</head>
<body>
    <h1><?php echo $greeter->greet('World'); ?></h1>
    <p>This app is running on PHP version: <?php echo phpversion(); ?></p>
</body>
</html>
?>