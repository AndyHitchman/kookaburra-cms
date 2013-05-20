'use strict'

describe 'Controller: PageCtrl', () ->

  # load the controller's module
  beforeEach module 'kookaburraApp'

  PageCtrl = {}
  scope = {}
  $httpBackend = {}

   # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope, $injector) ->
    $httpBackend = $injector.get '$httpBackend'
    $httpBackend.when('GET', '/content/sample.md').respond("Test")
    $httpBackend.expectGET 'content/sample.md'
    scope = $rootScope.$new()
    PageCtrl = $controller 'PageCtrl', {
      $scope: scope
    }

  it 'should be defined', () ->
    expect(PageCtrl).toBeDefined;
