#= require ../lib/angular/angular.js
#= require ../lib/bootstrap/bootstrap.js
#= require ../lib/lodash.js
#= require_self
#= require_tree .

# uses http://tombatossals.github.io/angular-leaflet-directive/#!/
module = angular.module('razum-base', [])

# make lodash available in HTML directives
module.run ['$rootScope', (rootScope) -> rootScope._ = _]