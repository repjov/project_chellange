'use strict'

angular.module "foxrey"
  .controller "LoginCtrl", ($scope, $auth, $state, localStorageService, config, AuthService, $http, api) ->

    $scope.login = (user) ->
      AuthService.login user
        .then (resp) ->
          console.log resp
          submit 'auth', resp.data
          api.getUser().then (info) ->
              console.log 'user', info

        .catch (resp) ->
          console.log 'error', resp

    submit = (key, val) ->
      localStorageService.set(key, val)