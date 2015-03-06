'use strict'

angular.module "foxrey"
  .factory 'AuthService', ($http, Session, config, localStorageService, API) ->
    class AuthService
      constructor: ->

      login: (credentials) ->
        API.post(config.apiUrl.signin, credentials)
          .then (res) =>
            localStorageService.set 'auth', res.data
            console.log @isAuthenticated()
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
      user: ->
        localStorageService.get 'userInfo' if @isAuthenticated
      getUserInfo: ->
        API.get(config.apiUrl.getUser)
          .then (info) ->
            localStorageService.set 'userInfo', info
            console.log 'creating session with', info
            Session.create info
            info
      isAuthenticated: ->
        !!Session.type
      isAuthorized: (authorizedRoles) =>
        authorizedRoles = [authorizedRoles] if !angular.isArray(authorizedRoles)
        console.log authorizedRoles, Session.type
        console.log 'logged in?', @isAuthenticated()
        console.log authorizedRoles.indexOf(Session.type) != -1
        @isAuthenticated() && authorizedRoles.indexOf(Session) != -1
      getToken: ->
        Session.user.token
      wrapActions: (resource, actions) ->
        tokenWrapper = (resource, action) ->
          resource['_' + action] = resource[action]
          resource[action] = (data, success, error) ->
            resource['_' + action] (angular.extend {}, data || {}, {access_token: tokenHandler.get()}, success, error)

        wrappedResource = resource
        (tokenWrapper(wrappedResource, action) for action in actions)
        wrappedResource

    new AuthService()