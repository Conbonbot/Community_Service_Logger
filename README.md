# README

This is a project for Mrs. Gay. We are going to computerize Crescenta Valley High School's community service system.

if server is locked, use lsof -wni tcp:8080 and then kill -9 PIDs
if running tests fail for unable to detect monitor changes, use echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p