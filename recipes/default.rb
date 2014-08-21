#
# Cookbook Name:: eol-rvm-wrapper
# Recipe:: default
#

require "ostruct"

include_recipe("rvm")

def set_ruby(rule_name)
  rvm_ruby name do
    action data.action.to_sym if data.action
  end
end

def set_default_ruby(name, data)
  rvm_default_ruby name
end

rvm_config = data_bag_item("eol-rvm-wrapper", "config")

rvm_config["rvm_ruby"].each do |name, data|
  data = OpenStruct.new(data)
  if data.nodes.empty? || data.nodes.include?(node.name)
    set_ruby(name, data) 
  end
end

rvm_config["rvm_default_ruby"].each do |name, data|
  data = OpenStruct.new(data)
  set_default_ruby(name) if (data.nodes.empty? || data.nodes.include(node.name))
end
