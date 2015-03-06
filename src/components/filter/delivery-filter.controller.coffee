angular.module "foxrey"
  .controller "filterDeliveryCtrl", ($scope, FilterDeliveryService) ->
    FilterDeliveryService.getAll().then (items) ->
      $scope.items = items