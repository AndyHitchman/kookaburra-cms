'use strict'

angular.module('kookaburraApp')
  .controller 'PageCtrl', ($scope, $route, $routeParams, s3) ->
    $scope.page = {}

    #TODO replce stub
    resource = 'index.json'

    s3.get "/pages/#{resource}", (err, data) ->
      $scope.page = data
