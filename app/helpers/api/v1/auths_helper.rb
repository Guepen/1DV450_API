module Api::V1::AuthsHelper

  def encode_jwt(creator, exp=2.hours.from_now)
    # add the expire to the payload, as an integer
    payload = { creator_id: creator.id }
    payload[:exp] = exp.to_i

    # Encode the payload whit the application secret, and a more advanced hash method (creates header with JWT gem)
    JWT.encode( payload, Rails.application.secrets.secret_key_base, "HS512")

  end

# When we get a call we have to decode it - Returns the payload if good otherwise false
  def decode_jwt(token)
    # puts token
    payload = JWT.decode(token, Rails.application.secrets.secret_key_base, "HS512")
    # puts payload
    if payload[0]["exp"] >= Time.now.to_i
      payload
    else
      puts "time fucked up"
      false
    end
      # catch the error if token is wrong
  rescue => error
    puts error
    nil
  end
end
