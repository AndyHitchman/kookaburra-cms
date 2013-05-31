'use strict';

angular.module('kookaburraApp')
  .directive('simple', ($sanitize) ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      simple = scope.$eval(attrs.simple)
      element.html $sanitize simple
  )
