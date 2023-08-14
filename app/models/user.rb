class User < ActiveRecord::Base
    enum role: {  admin: 0, user: 1 }
    has_secure_password
end