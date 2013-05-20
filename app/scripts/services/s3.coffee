'use strict';

angular.module('kookaburraApp')
  .factory 's3', ($http) ->
    {
      get: (contentPath, cb) ->
        $http
          .get(contentPath)
          .success (data) ->
            cb null, data
          .error (data, status) ->
            cb {status: status}, data
    }
