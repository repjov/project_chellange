angular.module "foxrey"
  .controller "DeliverySearchCtrl", ($scope, $state) ->

    $scope.open = ($event) ->
      $event.preventDefault()
      $event.stopPropagation()

      $scope.opened = true