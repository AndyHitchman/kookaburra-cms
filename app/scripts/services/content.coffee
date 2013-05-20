'use strict';

angular.module('kookaburraApp')
  .factory 'content', (s3, showdown) ->
  	{
  	  getHtml: (contentId, container) ->
		    s3.get "/content/#{contentId}.md", (err, content) ->
          container.content = showdown.convert content
    }
