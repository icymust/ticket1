hostnamectl set-hostname haproxy.master
echo "192.168.1. haproxy.master master" >> /etc/hosts
echo "192.168.1. node1.server node1" >> /etc/hosts
echo "192.168.1. node2.server node2" >> /etc/hosts
dnf install -y haproxy 
cp /etc/haproxy/haproxy.cfg{,.old}

echo "
global 
  log 127.0.0.1 local2 
  chroot /var/lib/haproxy 
  pidfile /var/run/haproxy.pid 
  maxconn 4000 
  user haproxy 
  group haproxy 
  daemon 
  stats socket /var/lib/haproxy/stats 
  ssl-default-bind-ciphers PROFILE=SYSTEM 
  ssl-default-server-ciphers PROFILE=SYSTEM 

defaults 
  mode http 
  log global 
  option httplog 
  option dontlognull 
  option http-server-close 
  option forwardfor except 127.0.0.0/8 
  option redispatch 
  retries 3 
  timeout http-request 10s 
  timeout queue 1m 
  timeout connect 10s 
  timeout client 1m 
  timeout server 1m 
  timeout http-keep-alive 10s 
  timeout check 10s 
  maxconn 3000 

frontend main 
  bind *:80 
  acl url_static path_beg -i /static /images /javascript /stylesheets 
  acl url_static path_end -i .jpg .gif .png .css .js 
  default_backend rockylinux9_apps 
  option forwardfor 
  option http-server-close 

backend rockylinux9_apps 
  balance roundrobin 
  server node1 node1.server:3000 check 
  server node2 node2.server:3000 check 

listen stats 
  bind haproxy.master:8080 # Bind stats to port 8080 
  log global # Enable Logging 
  stats enable # enable statistics reports 
  stats hide-version # Hide the version of HAProxy 
  stats refresh 30s # HAProxy refresh time 
  stats show-node # Shows the hostname of the node 
  stats auth admin:pass 
  stats uri /stats # Statistics URL
" > /etc/haproxy/haproxy.cfg

haproxy -c -f /etc/haproxy/haproxy.cfg
rsyslogd -N1

echo "
  _________ vi /etc/hosts -> vpisat ip node1,2,master ________
  _____ vi /etc/haproxy/haproxy.cfg -> pomenjat
  _____ vi /etc/rsyslog.conf -> module(load="imudp")
  ------  -> input(type="imudp")  uncomment----------
  _____systemctl restart rsyslog______
  _____systemctl restart haproxy______
  _____systemctl enable --now haproxy_____
"
