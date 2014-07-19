# coinbase-oauth-rails-example

An example rails app that demonstrates accessing user's coinbase accounts using the devise, omniauth-coinbase, and coinbase gems.

## Usage

```bash
bundle install
cp config/application.yml.example config/application.yml
```

Update `config/appplication.yml` with your client id and client secret

```bash
rake db:reset
rails server
```

Then navigate to the root path (default would be 'https://localhost:3000/')

You will be redirected to Coinbase and asked for access to your basic account information and balance. Upon approving the access, you will be redirected back to the root path where you will be shown your balance.

## Highlights

### Configuring the omniauth provider

In config/initializers/devise.rb:

```ruby
config.omniauth :coinbase, ... scope: 'user balance'
```

Here we configure the omniauth provider with the app credentials and the permissions we want to request our users to grant. The default is 'all' and it's mandatory to have at least one of 'all' and 'user'. A full list can be seen [here](https://coinbase.com/docs/api/permissions).

### Handling the omniauth callback

First we tell devise which controller to use to handle the omniauth callbacks

In config/routes.rb
```ruby
devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
```

Then we define a method with the same name as the provider ('coinbase'), look up or create a new user based on his uid, and sign him in.

In app/controllers/users/omniauth_callbacks_controller.rb:
```ruby
def coinbase
	@user = User.find_for_oauth(request.env["omniauth.auth"])
	@user.update_credentials! (request.env["omniauth.auth"]["credentials"])

	if @user.persisted?
	  sign_in_and_redirect @user, :event => :authentication
	else
	  session["devise.omniauth_data"] = request.env["omniauth.auth"]
	end
end
```

In app/models/user.rb
```ruby
def self.find_for_oauth(auth)
  where(auth.slice(:provider, :uid)).first_or_create do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.email = auth.info.email
    user.name = auth.info.name
  end
end
```

### Accessing the user's account

In app/controllers/coinbase_controller.rb:
```ruby
  coinbase = Coinbase::OAuthClient.new(Figaro.env.COINBASE_CLIENT_ID, Figaro.env.COINBASE_CLIENT_SECRET, current_user.credentials)

  @balance = coinbase.balance

  current_user.update_credentials!(coinbase.credentials)
```

First we instantiate a Coinbsae OAuthClient object using the logged in user's OAuth credentials, then we make a call to find out his balance, and finally we save his credentials in case the call to balance required the access token to be refreshed.
