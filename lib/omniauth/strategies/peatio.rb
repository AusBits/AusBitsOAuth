require "omniauth-oauth2"
require "peatio_client"

module OmniAuth
  module Strategies
    class Peatio < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site           => "https://yunbi.com"
      }

      uid do
        raw_info['sn']
      end

      info do
        {
          :email     => raw_info['email'],
          :name      => raw_info['name'],
          :accounts  => raw_info['accounts']
        }
      end

      extra do
        {
          :raw_info => raw_info
        }
      end

      def raw_info
        @me ||= peatio_client.get '/api/v2/members/me'
      end

      def authorize_params
        super.tap do |params|
          %w[scope client_options].each do |v|
            if request.params[v]
              params[v.to_sym] = request.params[v]
            end
          end

          params[:scope] ||= 'profile payment'
        end
      end

      private
      def peatio_client
        key, secret = access_token.token.split(':')
        @peatio_client ||= PeatioAPI::Client.new(
          access_key: key,
          secret_key: secret,
          endpoint:   options.client_options[:site]
        )
      end
    end
  end
end

OmniAuth.config.add_camelization "peatio", "Peatio"
