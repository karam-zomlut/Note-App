const app = require('./app');

// const port = app.get('PORT');

app.listen(8080, () => {
    console.log(`App listening on port ${8080}`);
})