angular.module "foxrey"
  .controller "StaticsCtrl", ($scope, $state) ->
    $scope.uiRouterState = $state
