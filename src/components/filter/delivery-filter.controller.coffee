angular.module "foxrey"
  .controller "filterDeliveryCtrl", ($scope, FilterDeliveryService) ->
    $scope.filter = {
      skip:0
      limit:10
    }

    FilterDeliveryService.getAll().then (items) ->
      $scope.items = items

    $scope.filterFunc = (param) ->
      FilterDeliveryService.getByFilter(param).then (items) ->
        $scope.items = items