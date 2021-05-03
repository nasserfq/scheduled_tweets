#email:string
# password_digest:string
#
# password:string virtual
class User < ApplicationRecord
  has_secure_password
end
