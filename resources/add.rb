property :users, kind_of: String, name_property: true

default_action :create

attribute :database, kind_of: String, required: true
attribute :password, kind_of: String, required: true
attribute :roles, kind_of: Array

def initialize(*args)
  super
  @resource_name = :users
  @action = :create
end

action :create do
  Chef::Log.info "Creating a user #{users}"
  client = mongo_client
  begin
    if @new_resource.roles
      client.database.users.update(@new_resource.users,
                                   password: @new_resource.password,
                                   roles: @new_resource.roles,
                                   database: @new_resource.database)
    else
      client.database.users.update(@new_resource.users,
                                   password: @new_resource.password,
                                   database: @new_resource.database)
    end
  rescue => err
    Chef::Log.fatal "Could not add the user #{err}"
  end
end

def mongo_client
  begin
    client = Mongo::Client.new(
      'mongodb://localhost:27017',
      database: 'admin',
      connect: :direct
    )
  rescue => err
    Chef::Log.fatal "Could not connect to the database #{err}"
  end
  client
end
