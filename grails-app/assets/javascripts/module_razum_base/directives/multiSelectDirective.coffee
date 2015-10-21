dependencies = ['$parse', '$injector']

directive = ($parse, $injector) ->
	restrict: 'A'
	link: (scope, el, attrs) ->
		initialBuild = true
		attrs.$observe 'multiSelect', (opts) ->
			options = {}
			
			# defaults
			if $injector.has('multiSelectDefaults')
				angular.merge options, $injector.get('multiSelectDefaults')
			
			#on-element attributes
			instanceOptions = $parse(opts)(scope)
			for key, val of instanceOptions
				instanceOptions[key] = decodeHTML(val) if angular.isString(val) #allow HTML encoded strings
			angular.merge options, instanceOptions
				
			if initialBuild
				el.multiselect options
				initialBuild = false
			else
				el.multiselect('setOptions', options)
				el.multiselect('rebuild')
				
decodeHTML = (html) ->
	txt = document.createElement('textarea')
	txt.innerHTML = html
	return txt.value

angular.module('razum-base').directive 'multiSelect', [dependencies..., directive]