'use strict'

angular.module('kookaburraApp')
  .controller 'PageCtrl', ($rootScope, $scope, $route, s3) ->
    $scope.page = {}

    resource = $route.current.params.page

    s3.get "/pages/#{resource}.json", (err, data) ->
      $rootScope.title = data.meta.title
      $scope.page = data
