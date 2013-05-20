'use strict';

angular.module('kookaburraApp')
  .factory 's3', ($http, $location) ->
    canonicalizedResource = (request) ->
      "/#{$location.host()}#{request.url}"

    canonicalizedAmzHeaders = (request) ->    
      _.chain(request.headers)
        .pairs()
        .map((header) -> [header[0].toLowerCase(), header[1]])
        .filter((header) -> _.string.startsWith header[0], 'x-amz-')
        .reduce(
          (memo, header, index) -> "#{memo}#{if index > 0 then '\n' else ''}#{header[0]}:#{header[1]}"
          '')
        .value()

    signString = (request) ->
      """
      #{request.method}
      #{request.headers['Content-MD5'] ? ''}
      #{request.headers['Content-Type'] ? ''} 
      
      #{canonicalizedAmzHeaders request}
      #{canonicalizedResource request}
      """

    {
      get: (contentPath, cb) ->
        request =
          method: 'GET'
          url: contentPath
          headers:
            'x-amz-date': new Date().toUTCString()

        signString = signString(request)

        $http(request)
          .success (data) ->
            cb null, data
          .error (data, status) ->
            cb {status: status}, data
    }
