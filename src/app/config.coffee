'use strict'

angular.module "foxrey"
  .constant 'config',
    apiUrl:
      base: 'http://localhost:4444/api/v1'
      signout: '/logout'
      signin: '/login'
      getUser: '/users'
    userRoles:
      all: '*'
      transport: 'tp'
      shipper: 'sheeper'