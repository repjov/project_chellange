angular.module "foxrey"
  .controller "RegisterTransportCtrl", ($scope) ->
    $scope.user = {}
    $scope.activeTab = 3

    # TODO: move to config
    $scope.privateForm = '/app/registration/common/private-registration.html'
    $scope.disclamier = '/app/registration/common/disclaimer-registration.html'

    $scope.register = () ->
      console.log $scope.user

    $scope.nextStep = () ->
      console.log $scope.user
      $scope.activeTab += 1
