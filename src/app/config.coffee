'use strict'

angular.module "foxrey"
  .constant 'config',
    apiUrl:
      base: 'http://localhost:4444/api'
      signout: '/v1/logout'
      signin: '/v1/login'
      getUser: '/v1/users'
    userRoles:
      all: '*'
      transport: 'tp'
      shipper: 'shipper'