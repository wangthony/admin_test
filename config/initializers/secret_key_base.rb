if (secret_key_base = ENV['SECRET_KEY_BASE']).present?
  Rails.application.config.secret_key_base = secret_key_base
end
