const express = require('express');
const server = require('http');
const httpProxy = require('http-proxy');

const app = express();
const port = 4000;

const appServer = server.createServer(app);
const apiProxy = httpProxy.createProxyServer(app);

apiProxy.on('error', (err, req, res) => {
    console.log(err);
    res.status(500).send('Proxy Error');
});

app.all('/users/*', (req, res) => {
    console.log(req.path);
    apiProxy.web(req, res, {
        target: process.env.USERS_HOST || 'http://localhost:3001',
    });
});

app.all('*', (req, res) => {
    console.log(req.path);
    apiProxy.web(req, res, {
        target: process.env.FRONTEND_HOST || 'http://localhost:3000',
    });
});

appServer.listen(port, () => console.log(`Gateway on port ${port}!`));