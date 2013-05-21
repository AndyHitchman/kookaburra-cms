'use strict'

describe 'Service: s3RequestSigner', () ->

  # load the service's module
  beforeEach module 'kookaburraApp'

  # instantiate service
  s3RequestSigner = {}
  beforeEach inject (_s3RequestSigner_) ->
    s3RequestSigner = _s3RequestSigner_

  it 'should create a valid signing string', () ->
    request =
      method: 'GET'
      url: '/content/path/to/fetch.resource'
      headers:
        'x-amz-date': new Date('Mon, 20 May 2013 22:19:23 GMT').toUTCString()

    actual = s3RequestSigner.stringToSign request
    expected = 
      """
      GET



      x-amz-date:Mon, 20 May 2013 22:19:23 GMT
      /server/content/path/to/fetch.resource
      """

    expect(actual).toEqual expected


  it 'should convert x-amx- header names to lower case string', () ->
    request =
      method: 'GET'
      url: '/content/path/to/fetch.resource'
      headers:
        'x-amz-date': new Date('Mon, 20 May 2013 22:19:23 GMT').toUTCString()

    actual = s3RequestSigner.stringToSign request
    expected = 
      """
      GET



      x-amz-date:Mon, 20 May 2013 22:19:23 GMT
      /server/content/path/to/fetch.resource
      """
    
    expect(actual).toEqual expected



  it 'should sort headers in the signing string', () ->
    request =
      method: 'GET'
      url: '/content/path/to/fetch.resource'
      headers:
        'x-amz-date': new Date('Mon, 20 May 2013 22:19:23 GMT').toUTCString()
        'x-amz-cheese': 'wensleydale'

    actual = s3RequestSigner.stringToSign request
    expected = 
      """
      GET



      x-amz-cheese:wensleydale
      x-amz-date:Mon, 20 May 2013 22:19:23 GMT
      /server/content/path/to/fetch.resource
      """

    expect(actual).toEqual expected

