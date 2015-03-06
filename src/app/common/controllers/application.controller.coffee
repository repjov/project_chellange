angular.module "foxrey"
  .controller "ApplicationCtrl", ($scope, $state, AuthService, localStorageService) ->
    @uiRouterState = $state
    @user = AuthService.getUserInfo() if localStorageService.get 'auth'