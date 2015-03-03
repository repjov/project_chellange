angular.module "foxrey"
  .controller "RegisterTransportCtrl", ($scope) ->
    $scope.user = {}

    # TODO: move to config
    $scope.privateForm = '/app/registration/common/private-registration.html'

    $scope.register = (user) ->
      console.log user
