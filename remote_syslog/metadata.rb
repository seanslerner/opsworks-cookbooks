maintainer        "Donald Piret"
maintainer_email  "donald@donaldpiret.com"
license           "Apache 2.0"
description       "Installs the remote_syslog gem for use with http://papertrailapp.com"
version           "0.1"
recipe            "remote_syslog::install", "Installs the remote_syslog gem"
recipe            "remote_syslog::deploy", "Start the daemon after deployment"

supports 'ubuntu'
