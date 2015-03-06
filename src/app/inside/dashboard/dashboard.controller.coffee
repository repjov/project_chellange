angular.module "foxrey"
  .controller "dashboardCtrl", ($scope, AuthService, $state) ->
    $scope.logout = () ->
      AuthService.logout()