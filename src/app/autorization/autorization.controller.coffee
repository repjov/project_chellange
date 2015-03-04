angular.module "foxrey"
  .controller "autorizationCtrl", ($scope, AuthService) ->
    $scope.login = (key, form) ->
      console.log AuthService.loginByCred key if form.$valid