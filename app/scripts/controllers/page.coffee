'use strict'

angular.module('kookaburraApp')
  .controller 'PageCtrl', ($scope, content) ->
  	$scope.content = content.getHtml 'sample'