angular.module "foxrey"
  .controller "BaseShipperCtrl", ($scope, $state, AuthService) ->
    @uiRouterState = $state
    @user = AuthService.getUserInfo()