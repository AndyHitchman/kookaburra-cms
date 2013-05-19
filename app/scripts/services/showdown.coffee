'use strict';

angular.module('kookaburraApp')
  .factory 'showdown', () ->
    converter = new Showdown.converter

    # Public API here
    {
      convert: (md) ->
        converter.makeHtml md 
    }
