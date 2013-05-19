'use strict'

angular.module('kookaburraApp', [])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/page.html'
        controller: 'PageCtrl'
      .otherwise
        redirectTo: '/'
