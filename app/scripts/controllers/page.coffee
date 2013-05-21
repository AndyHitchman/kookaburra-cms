'use strict'

angular.module('kookaburraApp')
  .controller 'PageCtrl', ($scope, $routeParams, content) ->
    $scope.contentContainer = {}
    content.getHtml 'sample', $scope.contentContainer