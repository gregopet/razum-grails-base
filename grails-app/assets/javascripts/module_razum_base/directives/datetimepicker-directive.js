//https://github.com/diosney/angular-bootstrap-datetimepicker-directive

'use strict';

angular.module('razum-base')

.provider('datetimepicker', function () {
	var default_options = {};

	this.setOptions = function (options) {
		default_options = options;
	};

	this.$get = function () {
		return {
			getOptions: function () {
				return default_options;
			}
		};
	};
})

.directive('datetimepicker', [
	'$timeout',
	'datetimepicker',
	function ($timeout, datetimepicker) {
		var default_options = datetimepicker.getOptions();

		return {
			require : '?ngModel',
			restrict: 'AE',
			scope   : {
				datetimepickerOptions: '@',
				ngModel: '='
			},
			link : function ($scope, $element, $attrs, ngModelCtrl) {
				var passed_in_options = $scope.$eval($attrs.datetimepickerOptions);
				var options = jQuery.extend({}, default_options, passed_in_options);

				if ($scope.ngModel) {
					options.defaultDate = angular.isNumber($scope.ngModel) ? moment(new Date($scope.ngModel)) : moment($scope.ngModel);
				}
				options.locale = moment.locale()
				
				$element
					.on('dp.change', function (e) {
						if (ngModelCtrl) {
							$timeout(function () {
								ngModelCtrl.$setViewValue(e.date);
							});
						}
					})
					.datetimepicker(options);
					
				function setPickerValue() {
					var date = null;

					if (ngModelCtrl && ngModelCtrl.$viewValue) {
						date = ngModelCtrl.$viewValue;
					}
					if (date) {
						$element.data('DateTimePicker').date(date);
					}
				}

				if (ngModelCtrl) {
					ngModelCtrl.$render = function () {
						setPickerValue();
					};
				}

				setPickerValue();
			}
		};
	}
]);