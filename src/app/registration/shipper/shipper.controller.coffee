angular.module "foxrey"
  .controller "RegisterShipperCtrl", ($scope) ->
    $scope.user = {}
    $scope.register = (user) ->
      console.log user
