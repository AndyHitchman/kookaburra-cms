'use strict'

describe 'Directive: part', () ->
  beforeEach module 'kookaburraApp'

  element = {}

  it 'should render the part content', inject ($rootScope, $compile) ->
    $rootScope.test = 
      format: 'text/html'
      content: 'wibble'
    element = angular.element '<div part="test"></div>'
    element = $compile(element) $rootScope
    expect(element.text()).toBe 'wibble'
