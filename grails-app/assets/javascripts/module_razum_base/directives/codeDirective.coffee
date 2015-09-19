# Defines a 'code' attribute which will replace the text of an element with the
# translation defined by the given code.
# e.g. <span code='js.some.name'></span>
# On receiving a 'languageChange' event, the directive will re-evaluate its contents.
angular.module('razum-base').directive 'code', [ 'translationService', (translationService) ->
	restrict: 'A'
	scope:
		code: '@'
		args: '='
	link: (scope, el) ->
		setText = ->
			translationService.translatorPromise.then (translator) ->
				el.text(translator.forCode(scope.code, scope.args))
				
		setText()
		scope.$on 'languageChange', setText
		scope.$watch 'args', setText
]

# Defines a param-code attribute to which a map is passed; the map's keys define
# the attributes to be assigned while the values define the translation codes that should
# be resolved as values of the attributes. If the values are an array then the first element
# represents the translation code while the rest represent the arguments.
# e.g. <input param-code="{placeholder:'js.some.placeholder'}" />
angular.module('razum-base').directive 'paramCode', [ 'translationService', (translationService) ->
	restrict: 'A'
	scope:
		ngTranslateParams: '='
		args: '='
	link: (scope, el) ->
		setText = ->
			translationService.translatorPromise.then (translator) ->
				for param, code of scope.ngTranslateParams
					if angular.isArray(code)
						el.attr param, translator.forCode(code[0], code[1..])
					else
						el.attr param, translator.forCode(code)
				null
		setText()
		scope.$on 'languageChange', setText
		scope.$watch 'args', setText
]