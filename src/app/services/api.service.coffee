'use strict'

angular.module "foxrey"
  .factory 'api', ($http, config) ->
    class Api
      contructor: ->

      getUser: (obj)->
        req =
          method: 'GET'
          url: config.auth.apiUrl + config.auth.getUser
          headers:
            token: obj.token

        $http(req)
          .then (res) ->
            res.data

    new Api()