'use strict'

describe 'Directive: simple', () ->
  beforeEach module 'kookaburraApp'

  element = {}

  it 'should render the simple content', inject ($rootScope, $compile) ->
    $rootScope.test = 'help!'
    element = angular.element '<div simple="test"></div>'
    element = $compile(element) $rootScope
    expect(element.text()).toBe 'help!'
