const http = require('node:http');
const fs = require('fs');

const server = http.createServer((req,res)=>{
    const {method, url} = req;

     fs.readFile('index.html','utf-8',(err,data)=>{
        if (err){
            res.end('Oops errors happened')
        }
        res.end(data);
    });
})
server.listen(8000);
