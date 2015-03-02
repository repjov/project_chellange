angular.module "foxrey"
  .controller "formValid", ($scope) ->
    $scope.create = (object, form) ->
    console.log object if form.$valid