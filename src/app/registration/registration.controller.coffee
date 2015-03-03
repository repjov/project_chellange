angular.module "foxrey"
  .controller "shipperSignupCtrl", ($scope) ->
    $scope.create = (object, form) -> console.log object if form.$valid

  .controller "transporterSignupCtrl", ($scope) ->
    $scope.stepNumber = 1
    $scope.transporter = {}
    $scope.dataPass = (object, form) ->
      if form.$valid
        $scope.transporter = object
        $scope.stepNumber++ if $scope.stepNumber<3

  .controller "autorizationCtrl", ($scope) ->
    $scope.isRegistered = true