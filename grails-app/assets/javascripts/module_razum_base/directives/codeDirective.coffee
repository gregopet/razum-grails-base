# Defines a 'code' attribute which will replace the text of an element with the
# translation defined by the given code.
# e.g. <span code='js.some.name'></span>
# On receiving a 'languageChange' event, the directive will re-evaluate its contents.
angular.module('razum-base').directive 'code', [ 'translationService', '$parse', (translationService, $parse) ->
	restrict: 'A'
	link: (scope, el, attrs) ->
		setText = (code) ->
			translationService.translatorPromise.then (translator) ->
				el.text(translator.forCode(attrs.code, $parse(attrs.args)(scope)))
				
		scope.$on 'languageChange', setText
		attrs.$observe 'code', setText
		attrs.$observe 'args', setText
]

# Defines a param-code attribute to which a map is passed; the map's keys define
# the attributes to be assigned while the values define the translation codes that should
# be resolved as values of the attributes. If the values are an array then the first element
# represents the translation code while the rest represent the arguments.
# e.g. <input param-code="{placeholder:'js.some.placeholder'}" />
angular.module('razum-base').directive 'paramCode', [ 'translationService', '$parse', (translationService, $parse) ->
	restrict: 'A'
	link: (scope, el, attrs) ->
		setText = ->
			translationService.translatorPromise.then (translator) ->
				paramCodes = $parse(attrs.paramCode)(scope)
				for param, code of paramCodes
					if angular.isArray(code)
						el.attr param, translator.forCode(code[0], code[1..])
					else
						el.attr param, translator.forCode(code)
				null
		scope.$on 'languageChange', setText
		attrs.$observe 'paramCode', setText
]