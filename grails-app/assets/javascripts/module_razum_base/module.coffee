#= require ../lib/moment-with-locales.js
#= require ../lib/lodash.js
#= require ../lib/jquery-1.11.3.js
#= require ../lib/angular.js
#= require ../lib/bootstrap.js
#= require ../lib/ui-bootstrap-tpls-0.13.4.js
#= require_self
#= require directives/dateFormatDirective.coffee
#= require directives/datetimepicker-directive.js
#= require services/translationService.js
#= require directives/codeDirective.js

module = angular.module('razum-base', ['ui.bootstrap'])

# make lodash and moment available in HTML directives
module.run ['$rootScope', (rootScope) -> 
			rootScope._ = _
			rootScope.moment = moment
]