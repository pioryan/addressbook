Rails.application.config.middleware.use OmniAuth::Builder do
  # The following is for facebook
  provider :facebook,"1176456559037496", "2dfae6a7bbb8fa53aed3b168b1d09053", {:scope => 'email'}

  # If you want to also configure for additional login services, they would be configured here.
end