const express = require('express');
const compression = require('compression');
const cookieParser = require('cookie-parser');
const { join } = require('path');
require('env2')('.env');

const api = require('./router')

const app = express();

app.set('PORT', process.env.PORT || 8080);
app.disabled('x-powered-by');
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(cookieParser());
app.use(compression());

app.use('/api/v1/', api)

if (process.env.Node_ENV === 'production') {
  app.use(express.static(join(__dirname, '..', 'client', 'build')));
  app.get('*', (req, res) => {
    res.sendFile(join(__dirname, '..', 'client', 'build', 'index.html'));
  })
}

module.exports = app;