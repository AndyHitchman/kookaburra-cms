'use strict'

describe 'Service: showdown', () ->

  # load the service's module
  beforeEach module 'kookaburraApp'

  # instantiate service
  showdown = {}
  beforeEach inject (_showdown_) ->
    showdown = _showdown_

  it 'should do something', () ->
    expect(!!showdown).toBe true;
