'use strict'

angular.module "foxrey"
  .factory 'api', ($http, config) ->
    class Api
      contructor: ->
        @getUser
        @logout

      get: (slug, object) ->
        $http.get([config.auth.apiUrl, slug].join('') )

      getUser: (obj)->
        req =
          method: 'GET'
          url: config.auth.apiUrl + config.auth.getUser
          headers:
            token: obj.token

        $http(req)
          .then (res) ->
            res.data

      logout: (obj)->
        req =
          method: 'GET'
          url: config.auth.apiUrl + config.auth.signout
          headers:
            token: obj.token

        $http(req)
          .then (res) ->
            res.data

    new Api()