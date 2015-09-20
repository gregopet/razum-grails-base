<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Razum grails application base</title>
	<asset:stylesheet href="razum_grails_base.css" />
	
	<%-- code highlighting --%>
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.7/styles/github.min.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.7/highlight.min.js"></script>
	<script type="text/javascript">hljs.initHighlightingOnLoad();</script>
	<style type="text/css">
		pre { 
			padding: 0; /* Let the syntax highlighting take care of it */
			overflow: auto;
		}
		
		pre code {
			white-space: pre;
			word-wrap: normal;
		}
	</style>
	
</head>
<body ng-app="razum-base">
	<div class="container-fluid">
		<h1 class="page-header">Razum grails application base - usage instructions</h1>
		
		
		<h2>Installation</h2>
		<p>
			Include the plugin as a compile dependency. Besides this, you may need to alter the appliacation's
			<tt>build.gradle</tt> since Grails fixes the version of certain dependencies in the <tt>mavenBom "org.grails:grails-bom:$grailsVersion"</tt>
			line. One such example is the fields plugin which you can override by adding the following block 
			into the <tt>dependencyManagement</tt> closure:
			<pre><code class="groovy">${'''\
			dependencies {
				dependency "org.grails.plugins:fields:2.1.0"
			}
			'''.stripIndent()}</code></pre>
		</p>
		
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
				<pre><code class="html">${'<asset:javascript src="lib/angular.js" />'}</code></pre>
			</div>
		</div>
		
		<hr>
		
		<div class="row">
			<div class="col-xs-6">
				<h2>
					Bootstrap
					<small><a href="http://getbootstrap.com/css/">docs</a></small>
				</h2>
				<p>Bootstrap support is included <span class="glyphicon glyphicon-heart text-red"></span></p>
				<p>Form validation classes are tweaked so they work with Angular's <tt>ng-invalid</tt> class and <tt>ng-cloak</tt> support is also included.</p>
			</div>
			<div class="col-xs-6">
				<h3><tt>layouts/main.gsp</tt></h3>
				<pre><code class="html">&lt;asset:stylesheet href="lib/bootstrap.css"/&gt;</code></pre>
			</div>
		</div>
		
		<hr>
		
		
		<div class="row">
			<div class="col-xs-6">
				<h2>
					UI Bootstrap
					<small><a href="http://angular-ui.github.io/bootstrap/">docs</a></small>
				</h2>
				<p>The glue between Bootstrap and Angular.</p>
				<p>
					<label class="control-label">
						<input type="checkbox" ng-model="isCollapsed">toggle me
					</label>
				</p>
				<div collapse="!isCollapsed" ng-cloak>
					<div class="well well-lg">Some content</div>
				</div>
					
				
			</div>
			<div class="col-xs-6">
				<h3><tt>index.gsp</tt></h3>
				<pre><code>${'''\
					<div collapse="isCollapsed">
						<div class="well well-lg">Some content</div>
					</div>
				'''.stripIndent()}</code></pre>
			
				<h3><tt>someCtrl.js</tt></h3>
				<pre><code>${'''\
					$scope.isCollapsed = false
				'''.stripIndent()}</code></pre>
			
			</div>
		</div>
		
		
		<hr>
		
		<div class="row">
			<div class="col-xs-6">
				<h2>Other CSS tweaks</h2>
				<p>To include non-bootstrap utilities you can pull in <tt>razum_grails_base.css</tt> which adds the <tt>.noselect</tt> and <tt>ng-cloak</tt> support</p>
				<p class="noselect">
					Can't select me (in some browsers, anyway).
				</p>
			</div>
			<div class="col-xs-6">
				<h3><tt>layouts/main.gsp</tt></h3>
				<pre><code class="html">&lt;asset:stylesheet href="razum_grails_base.css"/&gt;</code></pre>
			</div>
		</div>
		
		<hr>
		
		<div class="row">
			<div class="col-xs-6">
				<h2>
					<tt>razum-base</tt> Angular module
				</h2>
				<p>Adds a bunch of helpers for Angular and Bootstrap. See sections below for usage.</p>
			</div>
			<div class="col-xs-6">
				<h3><tt>layout.gsp</tt></h3>
				<pre><code class="html">${
					'''\
					<asset:style href="razum_grails_base.css" />
					
					...
					
					<asset:javascript src="module_razum_base/module.js" />
					'''.stripIndent()
				}</code></pre>
			</div>
		</div>
		
		<hr>
		
		<div class="row">
			<div class="col-xs-6">
				<h2>i18n link between Grails and Angular</h2>
				<p>
					Use messages from <tt>.properties</tt> files in Angular. Implement a simple controller serving them,
					the code sample here is all you need.
					<em>
						Angular code currently assumes translations are available at <tt>/api/translations</tt>, changing
						this or making it configurable should be trivial.
					</em>
				</p>
				<p ng-cloak>
					<input class="form-control" type="number" ng-model="translationNumber" ng-init="translationNumber=1"></input>
					<input class="form-control" type="text" ng-model="name" placeholder="Enter a name" ng-init="name='John'"></input>
					The translation for <tt>razum.grails.base.demo.{{translationNumber}}</tt> is: 
					<strong code="razum.grails.base.demo.{{translationNumber.toString()}}" args="{{[name]}}" ></strong>
				</p>
				<p>
					<input param-code="{placeholder: ['razum.grails.base.demo.{{translationNumber}}', '{{name}}']}" >
				</p>
			</div>
			<div class="col-xs-6">
				
				<h3><tt>TranslationsController.groovy</tt></h3>
				<pre><code class="groovy">${'''\
				import jssupport.MessagesList
				import grails.converters.JSON
				
				class TranslationsController {
					def messageSource

					def index() {
						//implement whatever caching strategy that best suits your app here
					
						def translations = MessagesList.getMessages(messageSource, request, "original.EVENT", "js.message" /* other prefixes interesting to JS.. */)
						render translations as JSON
					}
				}
				'''.stripIndent()}</code></pre>

				<h3><tt>messages.properties</tt></h3>
				<pre><code>${'''\
				original.EVENT.1=Phone call from {0}
				original.EVENT.2=Text message from {0}
				original.EVENT.3=Email from {0}
				'''.stripIndent()}</code></pre>
				
				<h3><tt>index.gsp</tt></h3>
				<pre><code class="html" ng-non-bindable>${'''\
					<span code='original.EVENT.{{event.type}}' args="{{[event.name]}}"></span>
					<span param-code="{title: ['original.EVENT.{{eventType}}, '{{event.name}}']}">tooltip here</span>
				'''.stripIndent()}</code></pre>
				
				
				<h3><tt>someService.coffee</tt> <small>(when you require translations outside of the view layer)</small></h3>
				<pre><code>${'''\
					dependencies = ['translationService']
					
					class MyService
						def translator
					
						constructor: (translationService) ->
							translationService.translatorPromise.then (translatorObj) -> translator = translatorObj
							
						constructMessage: (event) -> "We have received a #{translator.forCode('event.type', [event.name])}"
					
					angular.module('my-module').service 'myService', [ dependencies..., MyService]
				'''.stripIndent()}</code></pre>
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
				<pre><code class="coffee">${"""\
					for key, val in window
						console.log key, val
					""".stripIndent()
				}</code></pre>

				<h3><tt>index.gsp</tt></h3>
				<pre><code class="html">${"""<asset:javascript src='module.js' />"""}</code></pre>
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
				<pre><code class="groovy">${
					"""\
					DateTime joined

					...

					static mapping = {
						joined type: PersistentLocalDate
					}
					""".stripIndent()
				}</code></pre>
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
				<pre><code class="groovy">${
					"""\
					@JsonApi(["userDetails", "adminOverview"])
					DateTime joined
					""".stripIndent()
				}</code></pre>
				<h3><tt>UserController.groovy</tt></h3>
				<pre><code class="groovy">${
					"""\
					JSON.use("userDetails") {
						render user as JSON
					}
					""".stripIndent()
				}</code></pre>
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
				<pre><code class="coffee">${
					"""\
					_.chain(foos)
						.pluck('bar')
						.filter()
						.values()
					""".stripIndent()
				}</code></pre>
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
					<input type="text" date-format="${dateformat.fromStyle(style:'S-')}" ng-model="dateFormatSample" class="form-control" placeholder="type a valid date">
					{{ dateFormatSample }}
				</p>
				<p>
					Also available in Angular templates when using the <tt>razum-base</tt> module: {{ moment().toString() }}
				</p>
			</div>
			<div class="col-xs-6">
				<h3><tt>something.coffee</tt></h3>
				<pre><code class="coffee">${
					"""\
					console.log moment().subtract(7, 'days').fromNow()
					""".stripIndent()
				}</code></pre>
				
				<h3><tt>view.gsp</tt></h3>
				<pre><code class="html">${
					"""\
					<input ng-model='foo' date-format="${dateformat.fromStyle(style:'S-')}">
					""".stripIndent()
				}</code></pre>
				
				<h3><tt>layout.gsp</tt></h3>
				<pre><code class="html">${
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
				}</code></pre>
			</div>
		</div>
		
		<hr>
		
		<div class="row">
			<div class="col-xs-6">
				<h2>
					Bootstrap Moment.js Datetime picker
					<small><a href="http://eonasdan.github.io/bootstrap-datetimepicker/">docs</a></small>
				</h2>
				<p>
					Datepicker because HTML sucks in this regard. Integrated with Angular when using the <tt>razum-base</tt> angular module. Much better than the UI Bootstrap solution, uses Moment.js internally.
				</p>
				<div class="row">
					<div class="col-md-4">
						<datetimepicker datetimepicker-options="{inline: true, format: '${dateformat.fromStyle(style:'SS')}'}" ng-model="dateFrom" />
					</div>
					<div class="col-md-4">
						<datetimepicker datetimepicker-options="{inline: true, format: '${dateformat.fromStyle(style:'S-')}'}" ng-model="timeFrom" />
					</div>
					<div class="col-md-4">
						<input datetimepicker datetimepicker-options="{format: '${dateformat.fromStyle(style:'-S')}'}" ng-model="dateTo">
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">{{ dateFrom }}</div>
					<div class="col-md-4">{{ timeFrom }}</div>
					<div class="col-md-4">{{ dateTo }}</div>
				</div>
			</div>
			<div class="col-xs-6">
				<h3><tt>something.gsp</tt></h3>
				<pre><code class="html">${
					'''\
					<input class="form-control" datetimepicker ng-model="timeFrom" datetimepicker-options="{format: '${dateformat.fromStyle(style:'S-')}'}"></input>
					
					<datetimepicker datetimepicker-options="{inline: true, format: '${dateformat.fromStyle(style:'S-')}'}" ng-model="dateFrom" />
					'''.stripIndent()
				}</code></pre>
			</div>
		</div>
		
		<div class="row">
			<div class="col-xs-6">
				<h2>
					Fields plugin integration
					<small><a href="https://github.com/grails3-plugins/fields">docs</a></small>
				</h2>
				<p>
					Includes bootstrap-compatible rendering of fields. Dates use the datetime picker - defaults can be overriden by providing a <tt>widget-datetimepicker-options</tt> parameter. Enums are picked up automatically.
				</p>
			</div>
			<div class="col-xs-6">
				<h3><tt>Domain.groovy</tt></h3>
				<pre><code class="groovy">${
					'''\
					enum DomainClassType { SOME_TYPE }
					'''.stripIndent()
				}</code></pre>
				
				<h3><tt>messages.properties</tt></h3>
				<pre><code class="properties">${
					'''\
					domainClassType.SOME_TYPE=Some type
					'''.stripIndent()
				}</code></pre>
				
				<h3><tt>_fields.gsp</tt></h3>
				<pre><code class="properties">${
					'''\
					<f:field bean="bean" property="domainClassType" />
					'''.stripIndent()
				}</code></pre>
			</div>
		
		</div>
	</div>

	<asset:javascript src="module_razum_base/module.js" />
</body>
</html>