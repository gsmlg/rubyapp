class User < ActiveRecord::Base

    def self.auth (param)
        raise 2 unless param[:user_login]
        user = self.find(:user_login => param[:user_login])
        raise 1 unless user[:user_pass] == param[:user_pass]
        user
    end

    def self.login(params)
        user_login = params[:user_login]
        user_pass = params[:user_pass]
        self.find(:user_login => user_login, :user_pass => user_pass)
    end


end
