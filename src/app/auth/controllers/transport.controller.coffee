angular.module "foxrey"
  .controller "RegisterTransportCtrl", ($scope) ->
    $scope.activeTab = 1

    @register = () ->
      console.log $scope.user

    @nextStep = () =>
      console.log $scope.user
      $scope.activeTab += 1
