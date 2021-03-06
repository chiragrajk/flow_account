require "flow_account/version"

require "flow_account/error"
require "flow_account/configuration"
require "flow_account/api"
require "flow_account/client"
require "flow_account/response"

module FlowAccount
  extend Configuration

  def self.client(options={})
    FlowAccount::Client.new(options)
  end

  # Delegate to FlowAccount::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to FlowAccount::Client
  def self.respond_to?(method, include_all=false)
    return client.respond_to?(method, include_all) || super
  end
end
