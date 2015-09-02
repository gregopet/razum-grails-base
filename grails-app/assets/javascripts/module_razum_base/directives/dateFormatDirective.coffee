dependencies = []

strictParser = true

# This directive 
directive = ($timeout) ->
	restrict: 'A'
	require: 'ngModel'
	link: (scope, element, attrs, ngModelCtrl) ->
		format = attrs.dateFormat
		preventUpdates = false
		element.keydown -> preventUpdates = true
		element.keyup -> preventUpdates = false
		
		
		ngModelCtrl.$parsers.push (value) ->
			date = moment(value, format, strictParser)
			return date if date.isValid()
		ngModelCtrl.$render = () ->
			if ngModelCtrl.$modelValue and ngModelCtrl.$modelValue?.isValid and ngModelCtrl.$modelValue.isValid() and not preventUpdates
				printed = moment(ngModelCtrl.$modelValue).format(format)
				element.val(printed)

angular.module('common').directive 'dateFormat', [dependencies..., directive]