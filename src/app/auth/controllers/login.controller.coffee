'use strict'

angular.module "foxrey"
  .controller "LoginCtrl", ($scope, $state, config, AuthService, $stateParams) ->

    ###
    # @user {email: String, email: String}
    ###
    $scope.login = (user) ->
      AuthService.login(user).then (res) ->
        console.log res
        AuthService.getUserInfo().then (info) ->
          console.log info
          switch info.type
            when 'tp' then db = 'transport.dashboard'
            when 'sheeper' then db = 'shipper.dashboard'
            else db = 'home'
          console.log "path", db
          $state.go db

        .catch (res) ->
          console.log 'error', res

    return