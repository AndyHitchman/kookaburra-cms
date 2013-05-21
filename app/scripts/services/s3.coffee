'use strict';

angular.module('kookaburraApp')
  .factory 's3', ($http, s3RequestSigner) ->

    {
      get: (contentPath, cb) ->
        request =
          method: 'GET'
          url: contentPath
          headers:
            'x-amz-date': new Date().toUTCString()

        request.headers.Authorization = s3RequestSigner.sign(request)

        $http(request)
          .success (data) ->
            cb null, data
          .error (data, status) ->
            cb {status: status}, data
    }
