dependencies = ['$parse']

directive = ($parse) ->
	restrict: 'A'
	link: (scope, el, attrs) ->
		attrs.$observe 'multiSelect', (opts) ->
			options = $parse(opts)(scope)
			el.multiselect('setOptions', options)
			el.multiselect('rebuild')

angular.module('razum-base').directive 'multiSelect', [dependencies..., directive]