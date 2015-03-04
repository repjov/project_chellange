'use strict';

describe('Unit: Testing AuthService', function(){

  var AuthService, httpBackend;

  beforeEach(module('foxrey'));

  beforeEach(
    inject(
      function ( _AuthService_, $httpBackend ){
        AuthService = _AuthService_;
        httpBackend = $httpBackend;
      }
    )
  );


  it('should contain AuthService', function() {  
      expect(AuthService).not.toEqual(null);
  });

  it('should contain test registration by credentials', function() {
      var credentials = {
            "email": "sheeper@tp.com",
            "password": "qwerty123"
          }
          //console.log(AuthService.loginByCred(credentials));
      httpBackend.expectPOST('http://localhost:4444/api/v1/login').respond({
        result: {
          "token": "098f6bcd4621d373cade4e832627b4f6"
        }
      });
      httpBackend.expectGET('http://localhost:4444/api/v1/users').respond({
          "_id": "52da83a90870ded67d00012b",
          "__v": 83,
          "firstname": "Kirill",
          "lastname": "Zhurin",
          "email": "kirillzhurin@gmail.com",
          "username": "kirillzhurin",
          "provider": 1,
          "type": "sheeper",
          "role": "owner",
          "image": "http://petapixel.com/assets/uploads/2011/08/face1.jpg",
          "fullname": "Kirill Zhurin",
          "about": "I'm one of the developers of this app! Too!",
          "activate": true
      });

      AuthService.loginByCred(credentials).then(function(response){
        expect(response.type).toEqual("sheeper");
        console.log(response);
      })
      httpBackend.flush();
  });


});
