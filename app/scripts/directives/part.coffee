'use strict';

angular.module('kookaburraApp')
  .directive('part', (showdown) ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      part = scope.$eval(attrs.part)
      
      switch part.format 
        when 'text/markdown' then element.html showdown.convert part.content
        else  element.html part.content
  )
