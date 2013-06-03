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
      .when '/:page/edit',
        mode: 'edit'
        templateUrl: 'views/page.html'
        controller: 'PageCtrl'

      .when '/:page/:version',
        mode: 'view'
        templateUrl: 'views/page.html'
        controller: 'PageCtrl'

      .when '/:page',
        mode: 'view'
        templateUrl: 'views/page.html'
        controller: 'PageCtrl'
      .otherwise
        redirectTo: '/home'

