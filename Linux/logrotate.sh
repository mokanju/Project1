  Configure a log rotation scheme that backs up authentication messages to the `/var/log/auth.log`.
 
    - Add your config file edits below:
 
        /var/log/auth.log {
            rotate 49
            daily
            notifempty
            Compress
            delaycompress
            endscript
            }