'use strict';

angular.module('kookaburraApp')
  .directive('kbPart', (showdown) ->
    template: '<div></div>'
    restrict: 'A'
    link: (scope, element, attrs) ->
      element.text 'this is the kbPart directive'
      part = scope.$eval(attrs.kbPart)
      
      switch part.format 
        when 'text/markdown' then element.html showdown.convert part.content
        else  element.html part.content
  )
