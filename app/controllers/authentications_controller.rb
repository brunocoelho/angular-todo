class AuthenticationsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']

    provider = auth_hash[:provider]
    uid      = auth_hash[:uid]

    authentication = Authentication.find_by_provider_and_uid(provider, uid)
    if authentication
      p 'Tem autenticacao entrou aqui'
      user = authentication.user
    else
      p 'Nao tem autenticacao vai entrar aqui'
      name  = auth_hash[:info][:name]
      email = auth_hash[:info][:email]

      # Generating randomic password to use with devise validations.
      # Password won't be necessary, we are authenticating only with facebook.
      user = User.create(name: name,
                         email: email,
                         password: Devise.friendly_token[0,20])

      p ''
      p ''
      p user.errors.inspect
      p ''
      p ''

      access_token = auth_hash[:credentials][:token]
      expires_at   = auth_hash[:credentials][:expires_at]

      user.authentications.create(provider:     provider,
                                  uid:          uid,
                                  access_token: access_token,
                                  expires_at:   expires_at)
    end

    # OPTIMIZE: This flash message is breaking layout on production environment.
    # msg = "#{user.first_name} bem vindo ao Brechoh!" if user.new_record?
    sign_in_and_redirect(user, event: :authentication)
  end
end
