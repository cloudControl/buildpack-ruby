# container for all constants including vendor-specific ones
module Configs

  # vendor is determine based on $PAAS_VENDOR environment variable
  # if there is no such variable, Heroku is used as the default vendor
  # @return [Symbol] name of vendor
  def self.paas_vendor
    if ENV["PAAS_VENDOR"]
      ENV["PAAS_VENDOR"].downcase.to_sym
    else
      :heroku
    end
  end

  LIBYAML_VERSION     = "0.1.4"
  LIBYAML_PATH        = "libyaml-#{LIBYAML_VERSION}"
  BUNDLER_VERSION     = "1.2.1"
  BUNDLER_GEM_PATH    = "bundler-#{BUNDLER_VERSION}"
  NODE_VERSION        = "0.4.7"
  NODE_JS_BINARY_PATH = "node-#{NODE_VERSION}"
  JVM_VERSION         = "openjdk7-latest"

  # vendor specific constants
  if paas_vendor == :heroku
    S3_BUCKET_NAME = "heroku-buildpack-ruby"
    VENDOR_URL     = "https://s3.amazonaws.com/#{S3_BUCKET_NAME}"
    JVM_BASE_URL   = "http://heroku-jvm-langpack-java.s3.amazonaws.com"
  elsif paas_vendor == :cloudcontrol
    S3_BUCKET_NAME = "heroku-buildpack-ruby"
    VENDOR_URL     = "https://s3.amazonaws.com/#{S3_BUCKET_NAME}"
    JVM_BASE_URL   = "https://s3-eu-west-1.amazonaws.com/cloudcontrolled.com.packages"
  end
end
