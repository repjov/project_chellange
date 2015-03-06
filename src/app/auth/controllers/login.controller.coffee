'use strict'

angular.module "foxrey"
  .controller "LoginCtrl", ($scope, $state, config, AuthService, $stateParams, API) ->
    $scope.login = (user) ->
      AuthService.login(user).then (res) ->
        console.log res
        AuthService.getUserInfo().then (info) ->
          console.log info.data.type
          switch info.data.type
            when config.userRoles.transport then db = 'transport.dashboard'
            when config.userRoles.shipper then db = 'shipper.dashboard'
            else db = 'home'
          console.log "path", db
          $state.go db

        .catch (res) ->
          console.log 'error', res

    return