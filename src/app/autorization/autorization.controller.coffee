angular.module "foxrey"
  .controller "autorizationCtrl", ($scope, AuthService, $http) ->
    $scope.isRegistered = true
    $scope.notRegistered = () ->
      $scope.isRegistered = false
    $scope.login = (key, form) ->
      console.log AuthService.loginByCred key if form.$valid