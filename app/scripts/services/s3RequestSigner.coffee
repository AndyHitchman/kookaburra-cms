'use strict';

angular.module('kookaburraApp')
  .factory 's3RequestSigner', ($location, AWSCredentials, crypto) ->

    canonicalizedResource = (request) ->
      bucket = $location.host()
      if _.string.endsWith bucket, '.amazonaws.com'
        bucket = _.string.strLeft bucket, '.'
        
      "/#{bucket}#{request.url}"

    # Does not handle repeated headers, as this is not allowed in CoffeeScript strict mode.
    canonicalizedAmzHeaders = (request) ->    
      _.chain(request.headers)
        .pairs()
        .map((header) -> [header[0].toLowerCase(), header[1]])
        .filter((header) -> _.string.startsWith header[0], 'x-amz-')
        .sortBy((header) -> header[0])
        .reduce(
          (memo, header, index) -> "#{memo}#{if index > 0 then '\n' else ''}#{header[0]}:#{header[1]}"
          '')
        .value()

    # Public API here
    {
      stringToSign: (request) ->
        """
        #{request.method}
        #{request.headers['Content-MD5'] ? ''}
        #{request.headers['Content-Type'] ? ''}
        
        #{canonicalizedAmzHeaders request}
        #{canonicalizedResource request}
        """

      sign: (request) ->
        hmacSha1 = crypto.HMAC(
          crypto.SHA1 
          @stringToSign request 
          AWSCredentials.SecretAccessKey
          { asBytes: true })

        signatureDigest = crypto.util.bytesToBase64 hmacSha1 

        request.headers.Authorization = "AWS #{AWSCredentials.AccessKeyId}:#{signatureDigest}"
    }
