'use strict'

angular.module "foxrey"
  .service 'Session', ->
    #   "_id":"52da83a90870ded67d00012b",
    #   "__v":83,
    #   "firstname":"Kirill",
    #   "lastname":"Zhurin",
    #   "email":"kirillzhurin@gmail.com",
    #   "username":"kirillzhurin",
    #   "provider":1,
    #   "type": "sheeper",
    #   "role":"owner",
    #   "image":"http://petapixel.com/assets/uploads/2011/08/face1.jpg",
    #   "fullname":"Kirill Zhurin",
    #   "about":"I'm one of the developers of this app! Too!",
    #   "activate":true
    @create = (obj) =>
      @user = obj

    @destroy = =>
      @user = null

    @