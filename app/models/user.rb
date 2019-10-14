class User < ApplicationRecord
  has_many :oauths
  has_many :scores

  def discord_oauth
    Oauth.where(provider: :discord, user_id: id).first
  end
end
