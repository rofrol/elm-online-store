var express = require('express');
var bodyParser = require('body-parser');
var _ = require('lodash');

var app = express();

const PORT = 8000;

var allowCrossDomain = function(req, res, next) {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
};

app.use(bodyParser.json()); // for parsing application/json
app.use(bodyParser.urlencoded({ extended: true })); // for parsing application/x-www-form-urlencoded
app.use(allowCrossDomain);

app.get('/menu', function (req, res) {
  console.log('GET /menu');
  res.set('Content-Type', 'application/json');
  setTimeout(function() {
    res.status(200).send(menu);
  }, 800)
});

app.get('/cart', function (req, res) {
  console.log('GET /cart');
  res.set('Content-Type', 'application/json');
  setTimeout(function() {
    res.status(200).send(cart);
  }, 800)
});

app.get('/cart/clear', function (req, res) {
  console.log('GET /cart/clear');
  cart = {
    items: [],
    total: 0
  }
  res.set('Content-Type', 'application/json');
  setTimeout(function() {
    res.status(200).send(cart);
  }, 800)
});

app.post('/card', function (req, res) {
  console.log('POST /card');
  card = {
      number : req.body.number,
      name : req.body.name,
      exp : req.body.exp,
      cvv : req.body.cvv
  };

  res.set('Content-Type', 'application/json');
  setTimeout(function() {
    res.status(200).send(card);
  }, 800)
});

app.get('/card', function (req, res) {
  console.log('GET /card');
  res.set('Content-Type', 'application/json');
  setTimeout(function() {
    res.status(200).send(card);
  }, 800)
})

app.put('/cart/item', function (req, res) {
  console.log('PUT /cart/item');

  const id = req.body.id;
  const qty = req.body.qty;

  const foundItem = _.find(cart.items, function(item) {
      return id === item.id;
  });

  if (foundItem) {
      foundItem.qty += qty;
  } else {
      const item = _.find(items, function(item) {
        return id == item.id;
      })
      console.log('qty: ', qty);
      const newItem = {
        id: item.id,
        name: item.name,
        price: item.price,
        qty : qty
      }
      cart.items.push(newItem);
  }

  cart.subTotal = _.reduce(cart.items, function(sum, item) {
    return sum + (item.price * item.qty);
  }, 0)

  cart.tax = cart.subTotal * .042;
  cart.total = cart.subTotal + cart.tax;

  res.set('Content-Type', 'application/json');
  setTimeout(function() {
    res.status(200).send(cart);
  }, 800)
});

app.listen(PORT, function () {
  console.log('Running server on port: ', PORT);
});

var cart = {
  items: [],
  subTotal: 0,
  tax: 0,
  total: 0,
}

items = [
  {
    id: 1,
    name: 'Lawn Mower',
    price: 175
  },
  {
    id: 2,
    name: 'Desk',
    price: 120
  },
  {
    id: 3,
    name: 'Computer',
    price: 920
  },
  {
    id: 4,
    name: 'TV',
    price: 340
  },
  {
    id: 5,
    name: 'Knife Set',
    price: 190
  }
];

const menu = {
  items: items,
  storeId: 4
}

const user = {
  name: 'Darth Vader',
  money: 900
}
