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
  client = Mongo::Client.new(
    'mongodb://localhost:27017',
    database: 'admin',
    connect: :direct
  )
  client.database.users.update(@new_resource.users,
                                   password: @new_resource.password,
                                   roles: @new_resource.roles,
                                   database: @new_resource.database)
end
