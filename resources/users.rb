property :users, kind_of: String, name_property: true

default_action :create

attribute :database, kind_of: String, required: true
attribute :password, kind_of: String
attribute :roles, kind_of: Array

def initialize(*args)
  super
  @resource_name = :users
  @action = :create
end

action :create do
  Chef::Log.info "Creating a user #{users}"
end
