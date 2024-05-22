hostnamectl set-hostname node1.server
echo "192.168.1. haproxy.master master" >> /etc/hosts
echo "192.168.1. node1.server node1" >> /etc/hosts
echo "192.168.1. node2.server node2" >> /etc/hosts
dnf install -y nodejs

echo "
const http = require('http'); 
const port = 3000; 

http.createServer(function (req, res) { 
  res.write('Hello world! Node1'); 
  res.end(); 

}).listen(port, function () { 
  console.log(`Server is running on ${port}`); 

}); " > examLocal.js

echo "
_________ vi /etc/hosts -> vpisat ip node1,2,master ________
_________ vi examLocal.js -> pomenjat text na Node2 ________
_________ node examLocal.js ________
"
