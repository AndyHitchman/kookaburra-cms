'use strict'

describe 'Directive: kbPart', () ->
  beforeEach module 'kookaburraApp'

  element = {}

  it 'should render the part content', inject ($rootScope, $compile) ->
    $rootScope.test = 
      format: 'text/html'
      content: 'wibble'
    element = angular.element '<div kb-part="test"></div>'
    element = $compile(element) $rootScope
    expect(element.text()).toBe 'wibble'
