angular.module "foxrey"
  .controller "ApplicationCtrl", ($scope, $state, AuthService, localStorageService) ->
    @uiRouterState = $state
    @user = AuthService.userInfo()
    console.log @user

    return