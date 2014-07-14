set['opsworks_bundler']['version'] = '1.5.1'
set['manage_package'] = true
set['opsworks_rubygems']['version'] = '2.2.0'
set[:opsworks][:rails_stack][:name] = 'nginx_unicorn'

# Note that setting this using 'default' will let it easily get overridden
default[:deploy][:application_name] = 'your_application_name'
