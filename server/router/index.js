const api = require('express').Router();

api.get('/', (req, res) => {
    console.log('Home');
    res.json({page: 'Home Page'});
})

module.exports = api;