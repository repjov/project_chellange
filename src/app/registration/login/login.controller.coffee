'use strict'

angular.module "foxrey"
  .controller "LoginCtrl", ($scope, $auth, $state, localStorageService) ->
    $scope.login = (user) ->
      $auth.submitLogin user
        .then (resp) ->
          console.log resp
          submit 'auth', resp

        .catch (resp) ->
          console.log 'error', resp

    submit = (key, val) ->
      localStorageService.set(key, val);