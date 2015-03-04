'use strict'

angular.module "foxrey"
  .controller "LoginCtrl", ($scope, $state, config, AuthService) ->

    $scope.login = (user) ->
      AuthService.login(user).then (resp) ->
        console.log resp
        AuthService.getUserInfo().then (info) ->
          console.log info

        .catch (resp) ->
          console.log 'error', resp

    submit = (key, val) ->
