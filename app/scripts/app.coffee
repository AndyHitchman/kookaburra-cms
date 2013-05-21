'use strict'

angular.module('kookaburraApp', [])
  .value('AWSCredentials', {
      AccessKeyId: 'ABCDEFG'
      SecretAccessKey: 'ZXCVBNM'
    }
  )
  .value('crypto', window.Crypto)
    
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/page.html'
        controller: 'PageCtrl'
      .otherwise
        redirectTo: '/'

