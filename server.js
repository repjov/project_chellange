var express = require('express');
var app = express();
var bodyParser = require('body-parser');

var port = 4444;

app.configure(function(){
  app.use(express.bodyParser());
  app.use(express.cookieParser());
});


app.use('/api/v1', require('./fake/auth'));
app.use('/api/v1', require('./fake/deliveries'));

console.log("fake server was running on : http://localhost:%s", port);
app.listen(port);