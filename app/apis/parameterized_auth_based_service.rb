class ParameterizedAuthBasedService < ActionWebService::Base
 
  def verify_user(method_name, args)
    method=self.class.web_service_api.api_methods[method_name]
    params=method.expects_to_hash
    @user=User.find(:username => params['username'], :password => params['password']) 
#|| raise InvalidLoginError
  end
end
