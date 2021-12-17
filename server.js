const app = require('express')();
const http = require('http').Server(app);
const io = require('socket.io')(http);
const url = require('url');
const fs = require('fs');

const port = process.env.PORT || 3000

const server = http.createServer(function(request, response) {
    const path = url.parse(request.url).pathname;
    switch (path) {
        case '/':
            response.writeHead(200, {
                'Content-Type': 'text/plain'
            });
            response.write("This is Test Message.");
            response.end();
            break;
        case '/monitoring.html':
            fs.readFile(__dirname + path, function(error, data) {
                if (error) {
                    response.writeHead(404);
                    response.write(error);
                    response.end();
                } else {
                    response.writeHead(200, {
                        'Content-Type': 'text/html'
                    });
                    response.write(data);
                    response.end();
                }
            });
            break;
            case '/monitoring2.html':
                fs.readFile(__dirname + path, function(error, data) {
                    if (error) {
                        response.writeHead(404);
                        response.write(error);
                        response.end();
                    } else {
                        response.writeHead(200, {
                            'Content-Type': 'text/html'
                        });
                        response.write(data);
                        response.end();
                    }
                });
                break;
        default:
            response.writeHead(404);
            response.write("opps this doesn't exist - 404");
            response.end();
            break;
    }
});

server.listen(port, () => {
  console.log(`Server running at port ${port}`)
})
