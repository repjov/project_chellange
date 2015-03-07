angular.module "foxrey"
  .controller "SidebarCtrl", ($scope, $state, AuthService) ->
    @commonPart = '/components/views/common-sidebar-buttons.html'