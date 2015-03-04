angular.module "foxrey"
  .controller "NavbarCtrl", ($scope, AuthService) ->
    $scope.date = new Date()
    $scope.logout = ->
      AuthService.logout()
        .then (res) ->
          console.log res
        .catch (res) ->
          console.log 'error', res

    return