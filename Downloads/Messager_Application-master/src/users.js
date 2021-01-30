const express = require('express');
const path = require('path');
const redis = require('redis');
const { MongoClient } = require('mongodb');
const bodyParser = require('body-parser');
const app = express();

const port = process.env.PORT || 3001;

app.use(express.json());
app.use(bodyParser.urlencoded({extends: false}));

const client = redis.createClient({host: process.env.REDIS_HOST || 'localhost'});

const url = process.env.MONGO_HOST || 'mongodb://localhost:27017';
const mongo = new MongoClient(url, { useUnifiedTopology: true });

mongo.connect((err) => {
    if (err) {
        console.log(err);
        process.exit(1);
    }
    console.log('Successfully connected to server!');
});

const db = mongo.db('project');

app.post('/users/signup', (req, res) => {
    db.collection('users').createIndex({email: 1},{unique:true});
    db.collection('users').createIndex({username: 1},{unique:true});
    db.collection('users')
        .insertOne({
            username: req.body.username,
            firstName: req.body.firstName,
            lastName: req.body.lastName,
            email: req.body.email,
            password: req.body.password,
        })
        .then((docs) => {
            console.log('Account', docs.insertedId, 'created!');
            client.set(req.body.username + '_' + req.body.password, true);
            res.send({result : true});
        })
        .catch((err) => {
            res.send({result : false});
        });
});

app.listen(port, () => console.log(`Users on port ${port}!`));

