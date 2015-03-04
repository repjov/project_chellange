'use strict'

angular.module "foxrey"
  .factory 'api', ($http, AuthService, config) ->
    class Api
      contructor: ->

      getUser: ->
        req =
          method: 'GET'
          url: config.auth.apiUrl + config.auth.getUser
          headers:
            token: AuthService.getToken()

        $http(req)
          .then (res) ->
            res.data

    new Api()