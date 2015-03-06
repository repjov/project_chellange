angular.module "foxrey"
  .controller "RegisterShipperCtrl", ($scope) ->
    @register = (user) ->
      console.log 'register' user