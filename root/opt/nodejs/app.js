const http = require('http');
const url = require('url');
const hostname = '0.0.0.0';
const port = 3000;

const server = http.createServer(function (req, res) {
  const mypath = url.parse(req.url,true).pathname;
  console.log(mypath);

  res.writeHead(200, {'Content-Type': 'text/html'});
  res.end('hello world');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});

