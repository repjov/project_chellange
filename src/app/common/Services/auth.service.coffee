'use strict'

angular.module "foxrey"
  .factory 'AuthService', ($http, Session, config, localStorageService, API) ->
    class AuthService
      constructor: ->
        @init()

      init: ->
        info = localStorageService.get 'userInfo'
        if info
          Session.create info
      login: (credentials) ->
        API.post(config.apiUrl.signin, credentials)
          .then (res) ->
            localStorageService.set 'auth', res.data
            res.data
      logout: ->
        API.get(config.apiUrl.signout)
          .then (res) ->
            localStorageService.remove 'auth'
            localStorageService.remove 'userInfo'
            res
          .catch (res) ->
            if res.data.status == 'ok'
              localStorageService.remove 'auth'
              localStorageService.remove 'userInfo'
              res
      userInfo: ->
        localStorageService.get 'userInfo'
      getUserInfo: ->
        API.get(config.apiUrl.getUser)
          .then (info) ->
            localStorageService.set 'userInfo', info.data
            Session.create info
            info
      isAuthenticated: ->
        Session.type?
      isAuthorized: (authorizedRoles) =>
        authorizedRoles = [authorizedRoles] if !angular.isArray authorizedRoles
        @isAuthenticated() && authorizedRoles.indexOf(Session.type) != -1

    new AuthService()