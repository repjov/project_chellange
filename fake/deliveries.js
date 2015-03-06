var express = require('express');
var app = module.exports = express();
var token = "098f6bcd4621d373cade4e832627b4f6";
var deliveries = [
  {
    "id": "583617",
    "name": "iMac",
    "pickup_date": "02-02-2015",
    "category": "office",
    "images":["http://images.techhive.com/images/article/2014/01/imac2013-front-100225478-orig.jpg", "http://images.anandtech.com/doci/7365/iMacs_678x452.jpeg"]
  },
  {
    "id": "583618",
    "name": "Mac Book Pro",
    "category": "office",
    "pickup_date": "04-02-2015",
    "images":["http://cnet1.cbsistatic.com/hub/i/r/2014/08/04/3ab574dd-3da7-4413-bcbd-72590104f6ba/thumbnail/770x433/abe6888877b4e6963a93ebf1485c4152/apple-macbook-pro-with-retina-display-15-inch-july-2014-product-photos07.jpg"]
  },
  {
    "id": "583619",
    "name": "Table",
    "pickup_date": "05-03-2015",
    "category": "office",
    "images":["http://www.americanfurnituredsgn.com/Merchant2/graphics/00000001/160_Mission_Table.jpg"]
  },
  {
    "id": "583620",
    "name": "Luntic",
    "pickup_date": "01-03-2015",
    "category": "toys",
    "images":["https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTndRqfb_Pv-WSBZLGdReXkn1e644JGr6A_hfvnDvQGUPdSFvcHAA", "http://www.101slon.ru/_mod_files/ce_images/Luntik/luntic_razviv1.jpg"]
  },
];

app.get('/deliveries', function(req, res) {
    // if(req.headers.token && req.headers.token == token){
      var result = [];
      var filter = req.query;
      //немного говнокода не повредит
      if(filter.category && filter.pickup_date) {
        deliveries.map(function(element){
          if(filter.category == element.category && filter.pickup_date == element.pickup_date) {
            result.push(element);
          }
        });
      } else if(filter.category) {
        deliveries.map(function(element){
          if(filter.category == element.category) {
            result.push(element);
          }
        });
      } else if(filter.pickup_date) {
        deliveries.map(function(element){
          if(filter.pickup_date == element.pickup_date) {
            result.push(element);
          }
        });
      } else {
        result = deliveries;
      }

      //limitation
      if(filter.limit && filter.skip){
        var temp = [];
        for(i=filter.skip;i<result.length;i++){
          if(temp.length == filter.limit) continue;
          temp.push(result[i]);
        }
        result = temp;
      }

      res.json(200, result);
    // } else {
    //   res.json(403, {"status": 403, "error": "User is not authenticated"});
    // }
});