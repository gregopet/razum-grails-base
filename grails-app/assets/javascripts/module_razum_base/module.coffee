#= require ../lib/moment-with-locales.js
#= require ../lib/lodash.js
#= require ../lib/jquery-1.11.3.js
#= require ../lib/angular.js
#= require ../lib/bootstrap.js
#= require_self
#= require directives/dateFormatDirective.coffee
#= require directives/datetimepicker-directive.js

# uses http://tombatossals.github.io/angular-leaflet-directive/#!/
module = angular.module('razum-base', [])

# make lodash available in HTML directives
module.run ['$rootScope', (rootScope) -> rootScope._ = _]