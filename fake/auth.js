var express = require('express');
var app = module.exports = express();

var user_sheeper = {
    email: 'sheeper@tp.com',
    password: 'qwerty123',
    logged: false
};

var token = "098f6bcd4621d373cade4e832627b4f6";

var user_TP = {
    email: 'tp@foxrey.com',
    password: 'qwerty123',
    logged: false
};

app.get('/users', function(req, res) {
    if(req.headers.token && req.headers.token == token){
      if(user_sheeper.logged) {
        res.sendfile('./fake/data/auth/user_sheeper.json');
      }
      else if(user_TP.logged) {
        res.sendfile('./fake/data/auth/user_tp.json');
      }
      else {
        res.json(403, {"status": 403, "error": "This user is not logged"});
      }
    } else {
      res.json(403, {"status": 403, "error": "User is not authenticated"});
    }
});

app.post('/login', function(req, res) {
  if(req.body && (req.body.email === user_sheeper.email && req.body.password === user_sheeper.password)) {
    user_sheeper.logged = true;
    res.json(200, {"token": token});
    // res.sendfile('./fake/data/auth/user_sheeper.json');
  } else if(req.body && (req.body.email === user_TP.email && req.body.password === user_TP.password)){
    user_TP.logged = true;
    res.json(200, {"token": token});
    // res.sendfile('./fake/data/auth/user_tp.json');
  } else {
    res.json(403, {"status": 403, "error": "Login or password invalid"});
  }
   
});

app.get('/logout', function(req, res) {
  if(req.headers.token && req.headers.token == token){
    user_sheeper.logged = false;
    user_TP.logged = false;
    res.json(403, {"status": "ok"});
  } else {
    res.json(403, {"status": 403, "error": "User is not authenticated"});
  }
});