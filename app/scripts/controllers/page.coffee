'use strict'

angular.module('kookaburraApp')
  .controller 'PageCtrl', ($rootScope, $scope, $route, $routeParams, s3) ->
    $scope.page = {}

    #TODO replce stub
    resource = 'index.json'

    s3.get "/pages/#{resource}", (err, data) ->
      $rootScope.title = data.meta.title
      $scope.page = data
