'use strict';

angular.module('kookaburraApp')
  .factory 'content', ($http, $q, showdown) ->
  	{
  	  getHtml: (contentId) ->

		    $http
          .get("/content/#{contentId}.md")
          .then(
              (q) ->
                showdown.convert q.data
            ,
              (q) ->
                "Error"              
  	      )
    }
