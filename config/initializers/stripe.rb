Rails.configuration.stripe = {
  publishable_key: ENV['.'],
  secret_key:      ENV['.']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
