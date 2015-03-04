'use strict'

angular.module "foxrey"
  .provider 'config', ->
    config =
      auth:
        apiUrl: 'http://localhost:4444/api'
        signOutUrl: '/v1/logout'
        emailSignInPath: '/v1/login'
        storage: 'localStorage'
        handleLoginResponse: (response) -> response

    @setAuth = (value) ->
      config.auth = value

    @getAuth = ->
      config.auth

    @$get = ->
      config

    return