<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Razum grails application base</title>
	<asset:stylesheet href="lib/bootstrap.css" />
</head>
<body ng-app="usage">
	<div class="container-fluid">
		<h1 class="page-header">Razum grails application base - usage instructions</h1>
		
		<div class="row">
			<div class="col-xs-6">
			    <h2>Bootstrap</h2>
				<p>Bootstrap support is included <span class="glyphicon glyphicon-heart text-red"></span></p>
			</div>
			<div class="col-xs-6">
			    <h3><tt>layouts/main.gsp</tt></h3>
			    <pre>&lt;asset:stylesheet href="lib/bootstrap.css"/&gt;</pre>
			</div>
		</div>

		<div class="row">
			<div class="col-xs-6">
		        <h2>AngularJS</h2>
				<p>AngularJS is included: <input ng-model="foo" placeholder="type something.."> {{foo}}</p>
			</div>
			<div class="col-xs-6">
				<h3><tt>layouts/main.gsp</tt></h3>
				<pre>&lt;asset:javascript src="lib/angular.js" /&gt;</pre>
			</div>
		</div>
	</div>

	<asset:javascript src="lib/angular.js" />
	<script type="text/javascript">
	    angular.module("usage", [])
	</script>
</body>
</html>