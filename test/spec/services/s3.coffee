'use strict'

describe 'Service: s3', () ->

  # load the service's module
  beforeEach module 'kookaburraApp'

  # instantiate service
  s3 = {}
  $httpBackend = {}

  beforeEach inject (_s3_, $injector) ->
    s3 = _s3_
    $httpBackend = $injector.get '$httpBackend'
    $httpBackend.when('GET', '/content/sample.md').respond("Test")


  it 'should get content via an http get request', () ->
    $httpBackend.expectGET '/content/sample.md'
    s3.get '/content/sample.md', (err, content) ->
      expect(err).toBe(null)
      expect(content).toBe('Test')