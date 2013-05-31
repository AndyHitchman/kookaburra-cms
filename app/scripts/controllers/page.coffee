'use strict'

angular.module('kookaburraApp')
  .controller 'PageCtrl', ($rootScope, $scope, $route, $routeParams, s3) ->
    $scope.page = {}

    #TODO replce stub
    resource = $routeParams.page

    s3.get "/pages/#{resource}.json", (err, data) ->
      $rootScope.title = data.meta.title
      $scope.page = data
