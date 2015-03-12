angular.module "foxrey"
  .controller "autorizationCtrl", ($scope, $timeout, $state, AuthService) ->
    $scope.login = (key, form) ->
      if form.$valid
        AuthService.loginByCred key