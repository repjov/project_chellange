angular.module "foxrey"
  .controller "dashboardCtrl", ($scope, AuthService) ->
    $scope.logout = () ->
      AuthService.logout()
      $scope.$state.go 'home'