'use strict'

describe 'Service: s3RequestSigner', () ->

  # load the service's module
  beforeEach module 'kookaburraApp'

  # instantiate service
  AWSCredentials = {}

  # We are inject SUT for each test to allow browser url to be set before instantiation of service
  beforeEach inject (_AWSCredentials_, $browser) ->
    AWSCredentials = _AWSCredentials_
    # We are using this host name specifically to test signature matches example
    # given at https://s3.amazonaws.com/doc/s3-developer-guide/RESTAuthentication.html
    $browser.url 'http://quotes'


  it 'should create a valid signing string', inject (s3RequestSigner) ->
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
      /quotes/content/path/to/fetch.resource
      """

    expect(actual).toEqual expected


  it 'should convert x-amx- header names to lower case string', inject (s3RequestSigner) ->
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
      /quotes/content/path/to/fetch.resource
      """
    
    expect(actual).toEqual expected



  it 'should sort headers in the signing string', inject (s3RequestSigner) ->
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
      /quotes/content/path/to/fetch.resource
      """

    expect(actual).toEqual expected


  it 'should sign exactly as the examples on the amazon doco', inject (s3RequestSigner) ->
    # https://s3.amazonaws.com/doc/s3-developer-guide/RESTAuthentication.html
    # Except we are using virtual host, so fake location

    request =
      method: 'GET'
      url: '/nelson'
      headers:
        'X-Amz-Magic': 'abracadabra'
        'X-Amz-Date': 'Thu, 17 Nov 2005 18:49:58 GMT'

    AWSCredentials.AccessKeyId = '44CF9590006BF252F707'
    AWSCredentials.SecretAccessKey = 'OtxrzxIsfpFjA7SwPzILwy8Bw21TLhquhboDYROV'

    expected = 'AWS 44CF9590006BF252F707:5m+HAmc5JsrgyDelh9+a2dNrzN8='

    console.log s3RequestSigner.stringToSign request

    actual = s3RequestSigner.sign request

    expect(actual).toEqual expected