'use strict'

angular.module('kookaburraApp')
  .controller 'PageCtrl', ($scope, content) ->
    $scope.contentContainer = {}
    content.getHtml 'sample', $scope.contentContainer