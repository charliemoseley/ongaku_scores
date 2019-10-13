class User < ApplicationRecord
  has_many :oauths

  def discord_oauth
    Oauth.where(provider: :discord, user_id: id).first
  end
end
