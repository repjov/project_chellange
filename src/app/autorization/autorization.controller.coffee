angular.module "foxrey"
  .controller "autorizationCtrl", ($scope, $timeout, AuthService) ->
    $scope.login = (key, form) ->
      if form.$valid
        AuthService.loginByCred key
        $timeout((() ->
          $scope.$state.go 'inside')
          100)