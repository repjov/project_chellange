angular.module "foxrey"
  .controller "RegisterTransportCtrl", ($scope) ->
    $scope.user = {}
    $scope.activeTab = 1

    # TODO: move to config
    $scope.privateForm = '/app/registration/common/private-registration.html'

    $scope.register = () ->
      console.log $scope.user

    $scope.nextStep = (user) ->
      console.log user
      angular.extend($scope.user, user)
      $scope.activeTab += 1
