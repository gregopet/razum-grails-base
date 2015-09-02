<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Razum grails application base</title>
	<asset:stylesheet href="lib/bootstrap.css" />
</head>
<body ng-app="razum-base">
	<div class="container-fluid">
		<h1 class="page-header">Razum grails application base - usage instructions</h1>
		
		<div class="row">
			<div class="col-xs-6">
			    <h2>
			        Bootstrap
			        <small><a href="http://getbootstrap.com/css/">docs</a></small>
			    </h2>
				<p>Bootstrap support is included <span class="glyphicon glyphicon-heart text-red"></span></p>
			</div>
			<div class="col-xs-6">
			    <h3><tt>layouts/main.gsp</tt></h3>
			    <pre>&lt;asset:stylesheet href="lib/bootstrap.css"/&gt;</pre>
			</div>
		</div>
		
		<hr>

		<div class="row">
			<div class="col-xs-6">
		        <h2>
		            AngularJS
		            <small><a href="https://code.angularjs.org/1.4.3/docs/api">docs</a></small>
                </h2>
				<p>AngularJS is included: <input ng-model="foo" placeholder="type something.."> {{foo}}</p>
			</div>
			<div class="col-xs-6">
				<h3><tt>layouts/main.gsp</tt></h3>
				<pre>&lt;asset:javascript src="lib/angular.js" /&gt;</pre>
			</div>
		</div>

		<hr>
		
		<div class="row">
			<div class="col-xs-6">
		        <h2>CoffeeScript
		            <small><a href="http://coffeescript.org/">docs</a></small>
		        </h2>
				<p>CoffeeScript works out of the box</p>
			</div>
			<div class="col-xs-6">
				<h3><tt>module.coffee</tt></h3>
				<pre>${"""\
				    for key, val in window
				        console.log key, val
				    """.stripIndent()
				}</pre>

				<h3><tt>index.gsp</tt></h3>
				<pre>${"""<asset:javascript src='module.js' />"""}</pre>
			</div>
		</div>
		
		<hr>

		<div class="row">
            <div class="col-xs-6">
                <h2>
                    Joda Time
                    <small>
                        <a href="http://www.joda.org/joda-time/">docs</a>
                        <a href="http://jadira.sourceforge.net/apidocs/index.html">hibernate</a>
                        <a href="http://gpc.github.io/joda-time/">plugin</a>
                    </small>
                </h2>
                <p>Server code can use Joda Time and it works in domain classes, too.</p>
                <p>According to the server, the current date is ${new org.joda.time.LocalDate()}</p>
            </div>
            <div class="col-xs-6">
                <h3><tt>User.groovy</tt></h3>
                <pre>${
                    """\
                    DateTime joined

                    ...

                    static mapping = {
                        joined type: PersistentLocalDate
                    }
                    """.stripIndent()
                }</pre>
            </div>
        </div>
        
        <hr>

        <div class="row">
            <div class="col-xs-6">
                <h2>
                    JSON Apis plugin
                    <small><a href="https://github.com/gregopet/grails-json-apis">doc</a></small>
                </h2>
                <p>To define named APIs you can annotate fields and properties in domain classes accordingly.</p>
            </div>
            <div class="col-xs-6">
                <h3><tt>User.groovy</tt></h3>
                <pre>${
                    """\
                    @JsonApi(["userDetails", "adminOverview"])
                    DateTime joined
                    """.stripIndent()
                }</pre>
                <h3><tt>UserController.groovy</tt></h3>
                <pre>${
                    """\
                    JSON.use("userDetails") {
                        render user as JSON
                    }
                    """.stripIndent()
                }</pre>
            </div>
        </div>
        
        <hr>
        
        <div class="row">
            <div class="col-xs-6">
                <h2>
                    Lo-dash
                    <small><a href="https://lodash.com/docs">doc</a></small>
                </h2>
                <p>The replacement to underscore! Also available in Angular templates when using the <tt>razum-base</tt> module.</p>
            </div>
            <div class="col-xs-6">
                <h3><tt>something.coffee</tt></h3>
                <pre>${
                    """\
					_.chain(foos)
						.pluck('bar')
						.filter()
						.values()
                    """.stripIndent()
                }</pre>
            </div>
        </div>
        
        <hr>
        
        <div class="row">
            <div class="col-xs-6">
                <h2>
                    Moment.js
                    <small><a href="http://momentjs.com/docs/">doc</a></small>
                </h2>
                <p>
					Sane dates with Javascript. Comes with a Joda-to-Moment format conversion, your medium moment.JS datetime format is 
					<dateformat:fromStyle style="MM" />. Can augment the <tt>ngModelController</tt> for use in e.g. inputs:
					<input type="text" date-format="${dateformat.fromStyle(style:'S-')}" ng-model="dateFormatSample" placeholder="type a valid date">: {{ dateFormatSample }}
				</p>
            </div>
            <div class="col-xs-6">
                <h3><tt>something.coffee</tt></h3>
                <pre>${
                    """\
					console.log moment().subtract(7, 'days').fromNow()
                    """.stripIndent()
                }</pre>
                
                <h3><tt>view.gsp</tt></h3>
                <pre>${
                    """\
					<input ng-model='foo' date-format="${dateformat.fromStyle(style:'S-')}">
                    """.stripIndent()
                }</pre>
                
                <h3><tt>layout.gsp</tt></h3>
                <pre>${
                    '''\
					<script type="text/javascript">
						//set the same locale in JS as on the server
						moment.locale('${org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).language}');
						
						//get the proper time, date or datetime format via taglibs
						var momentDateFormat = '${dateformat.fromStyle(style:"S-")}'
						var momentTimeFormat = '${dateformat.fromStyle(style:"-M")}'
						var momentDateTimeFormat = '${dateformat.fromStyle(style:"MS")}'
					</script>
                    '''.stripIndent()
                }</pre>
            </div>
        </div>
        
        <hr>

        <div class="row">
            <div class="col-xs-6">
                <h2>
                    Bootstrap Moment.js Datetime picker
                    <small><a href="http://eonasdan.github.io/bootstrap-datetimepicker/">docs</a></small>
                </h2>
                <p>Datepicker because HTML sucks in this regard. Integrated with Angular when using the <tt>razum-base</tt> angular module.</p>
                <p>
					<datetimepicker datetimepicker-options="{inline: true, format: '${dateformat.fromStyle(style:'SS')}'}" ng-model="dateFrom" />
                </p>
            </div>
            <div class="col-xs-6">
                <h3><tt>something.gsp</tt></h3>
                <pre>${
                    '''\
					<datetimepicker datetimepicker-options="{inline: true, format: '${dateformat.fromStyle(style:'S-')}'}" ng-model="dateFrom" />
                    '''.stripIndent()
                }</pre>
            </div>
        </div>
        
        <hr>
        
        
        <div class="row">
            <div class="col-xs-6">
                <h2>
                    <tt>razum-base</tt> Angular module
                </h2>
                <p>Adds a bunch of helpers for Angular. See other sections for usage.</p>
            </div>
            <div class="col-xs-6">
                <h3><tt>layout.gsp</tt></h3>
                <pre>${
                    '''\
                    <asset:javascript src="module_razum_base/module.coffee" />
                    '''.stripIndent()
                }</pre>
            </div>
        </div>
	</div>

	<asset:javascript src="module_razum_base/module.coffee" />
</body>
</html>