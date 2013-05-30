'use strict'

angular.module('kookaburraApp', ['ngSanitize'])
  .value('AWSCredentials', {
      AccessKeyId: 'ABCDEFG'
      SecretAccessKey: 'ZXCVBNM'
    }
  )
  .value('crypto', window.Crypto)
    
  .config ($routeProvider) ->
    $routeProvider
      .when '/:page',
        templateUrl: 'views/page.html'
        controller: 'PageCtrl'
      .otherwise
        redirectTo: '/home'

