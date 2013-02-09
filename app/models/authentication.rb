class Authentication < ActiveRecord::Base
  attr_accessible :access_token, :expires_at, :provider, :uid, :user_id
  belongs_to :user
end
