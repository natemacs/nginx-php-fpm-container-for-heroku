<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>NGINX HEROKU Boilerplate Container</title>
  </head>
  <body>
    <?php $variable = $_GET['query']??''; ?>
    <h1><?php echo 'Hello Heroku with PHP ' . $variable; ?></h1>
  </body>
</html>