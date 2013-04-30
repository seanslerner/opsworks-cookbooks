# Fast-apply an app's custom configuration.

if node[:opsworks][:instance][:layers].include?('rails-app')
  node[:deploy].each do |application, deploy|
    custom_env_template do
      application application
      deploy deploy
      env node[:custom_env][application]
    end
    
  end
end
