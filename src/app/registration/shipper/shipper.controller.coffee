angular.module "foxrey"
  .controller "RegisterShipperCtrl", ($scope) ->
    # TODO: move to config
    $scope.privateForm = '/app/registration/common/private-registration.html'
    $scope.disclaimer = '/app/registration/common/disclaimer-registration.html'

    $scope.register = (user) ->
      console.log user