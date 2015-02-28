### Run the project
`gulp serve`

### All Gulp tasks

* `gulp` or `gulp build` to build an optimized version of your application in `/dist`
* `gulp serve` to launch a browser sync server on your source files
* `gulp serve:dist` to launch a server on your optimized application
* `gulp test` to launch your unit tests with Karma
* `gulp test:auto` to launch your unit tests with Karma in watch mode
* `gulp protractor` to launch your e2e tests with Protractor
* `gulp protractor:dist` to launch your e2e tests with Protractor on the dist files

More information on the gulp tasks in [this README.md](https://github.com/Swiip/generator-gulp-angular/blob/master/app/templates/gulp/README.md).

### Run Fake server
`node server.js`

### Fake API list
**Sign In**

Credentials:
 * shipper individual - `{"email": "sheeper@tp.com","password": "qwerty123"}`
 * transport provider - `{"email": "tp@foxrey.com","password": "qwerty123"}`
 
 
```
Url: `http://localhost:4444/api/v1/login`
Method: POST
Body: {
    "email": "sheeper@tp.com",
    "password": "qwerty123"
}
------------
Response: {
    "token": "098f6bcd4621d373cade4e832627b4f6"
}
```

**Get Logged User**
```
Url: `http://localhost:4444/api/v1/users`
Method: GET
Header: {token: '098f6bcd4621d373cade4e832627b4f6'}
------------
Response:{
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
}
```

**Logout**
```
Url: `http://localhost:4444/api/v1/logout`
Method: GET
Header: {token: '098f6bcd4621d373cade4e832627b4f6'}
------------
Response:{status: "ok"}
```

**Get all deliveries**
```
Url: `http://localhost:4444/api/v1/deliveries`
Method: GET
Header: {token: '098f6bcd4621d373cade4e832627b4f6'}
------------
Response:[
    {
        "id": "583617",
        "name": "iMac",
        "pickup_date": "02-02-2015",
        "category": "office",
        "images": [
            "http://images.techhive.com/images/article/2014/01/imac2013-front-100225478-orig.jpg",
            "http://images.anandtech.com/doci/7365/iMacs_678x452.jpeg"
        ]
    }
]
```

**Get deliveries with filter**

Possible categories:
* office
* toys

```
Url: `http://localhost:4444/api/v1/deliveries`
Method: GET
Header: {token: '098f6bcd4621d373cade4e832627b4f6'}
Params:{
    category:"office"
    pickup_date:"02-02-2015"
    limit:10
    skip:0
}
------------
Response:[
    {
        "id": "583617",
        "name": "iMac",
        "pickup_date": "02-02-2015",
        "category": "office",
        "images": [
            "http://images.techhive.com/images/article/2014/01/imac2013-front-100225478-orig.jpg",
            "http://images.anandtech.com/doci/7365/iMacs_678x452.jpeg"
        ]
    }
]
```