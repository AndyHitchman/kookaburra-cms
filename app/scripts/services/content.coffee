'use strict';

angular.module('kookaburraApp')
  .factory 'content', ($http, showdown) ->
  	{
  	  getHtml: (contentId, container) ->
		    $http
          .get("/content/#{contentId}.md")
          .success (data) ->
            container.content = showdown.convert data
    }