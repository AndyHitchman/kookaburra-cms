'use strict'

describe 'Service: content', () ->

  # load the service's module
  beforeEach module 'kookaburraApp'

  # instantiate service
  content = {}
  beforeEach inject (_content_) ->
    content = _content_

  it 'should do something', () ->
    expect(!!content).toBe true;
