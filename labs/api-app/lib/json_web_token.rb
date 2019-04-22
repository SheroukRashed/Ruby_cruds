# For authenticating the user and generating a token for him/her using encode.
# To check if the user's token appended in each request is correct by using decode.

class JsonWebToken
    class << self
        # The first method, encode, takes three parameters -- 
        # the user ID, the expiration time (1 day), 
        # and the unique base key of your Rails application -- 
        # to create a unique token.
      def encode(payload, exp = 24.hours.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, Rails.application.secrets.secret_key_base)
      end
   
        # The second method, decode, takes the token 
        # and uses the application's secret key to decode it.
      def decode(token)
        body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
        HashWithIndifferentAccess.new body
      rescue
        nil
      end
    end
end


