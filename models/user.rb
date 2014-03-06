class User < ActiveRecord::Base

    def self.auth (param)
        raise 2 unless param[:user_login]
        user = self.find(:user_login => param[:user_login])
        raise 1 unless user[:user_pass] == param[:user_pass]
        user
    end


end
