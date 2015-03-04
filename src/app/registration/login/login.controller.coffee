'use strict'

angular.module "foxrey"
  .controller "LoginCtrl", ($scope, $auth) ->
    $scope.master = {}

    $scope.login = (user) ->
      $scope.master = angular.copy(user)
      $auth.submitLogin $scope.master
        .then (resp) ->
          console.log resp
        .catch (resp) ->
          console.log 'error', resp

    $scope.reset = (form) ->
      if (form)
        form.$setPristine()
        form.$setUntouched()
      $scope.user = angular.copy($scope.master)

    $scope.reset()
