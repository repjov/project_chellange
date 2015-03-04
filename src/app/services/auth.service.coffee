'use strict'

angular.module "foxrey"
  .factory 'AuthService', ($http, Session, config, localStorageService, api) ->
    class AuthService
      contructor: ->
        @login()
        @isAuthenticated()
        @isAuthorized()
        @getToken()
        @wrapActions()
        @getUserInfo()

      login: (credentials) ->
        $http.post(config.auth.apiUrl + config.auth.emailSignInPath, credentials)
          .then (res) ->
            localStorageService.set 'auth', res.data
            res.data
      getUserInfo: ->
        api.getUser(localStorageService.get 'auth')
          .then (info) ->
            Session.create info
            info
      isAuthenticated: ->
        !!Session.token
      isAuthorized: (authorizedRoles) =>
        authorizedRoles = [authorizedRoles] if !angular.isArray(authorizedRoles)
        @isAuthenticated() && authorizedRoles.indexOf(Session.userRole) != -1
      getToken: ->
        Session.token
      wrapActions: (resource, actions) ->
        tokenWrapper = (resource, action) ->
          resource['_' + action] = resource[action]
          resource[action] = (data, success, error) ->
            resource['_' + action] (angular.extend {}, data || {}, {access_token: tokenHandler.get()}, success, error)

        wrappedResource = resource
        (tokenWrapper(wrappedResource, action) for action in actions)
        wrappedResource

    new AuthService()