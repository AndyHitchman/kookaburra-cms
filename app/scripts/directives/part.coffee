'use strict';

angular.module('kookaburraApp')
  .directive('part', (showdown) ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      part = scope.$eval(attrs.part)
      
      element.html(
        switch part.format 
          when 'text/markdown' then showdown.convert part.content
          else part.content
      )
  )
