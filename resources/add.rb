use_inline_resources if defined?(use_inline_resources)

default_action :create

property :users, kind_of: String, name_property: true
property :database, kind_of: String, required: true
property :password, kind_of: String, required: true
property :roles, kind_of: Array

def initialize(*args)
  super
  @resource_name = :users
  @action = :create
end

action :create do
  Chef::Log.info "Creating a user #{users}"
  client = mongo_client
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
end

def mongo_client
  begin
    client = Mongo::Client.new(
      "mongodb://#{node['mongodb']['host']}:#{node['mongodb']['port']}",
      database: 'admin',
      connect: :direct
    )
  rescue => err
    Chef::Log.fatal "Could not connect to the database #{err}"
  end
  client
end

def load_current_resource
  @current_resource = Chef::Resource.mongodb_users_add.new(@new_resource.name)
  @current_resource.username(@new_resource.users)
  @current_resource.database(@new_resource.database)
  client = mongo_client
  client_count = client['system.users'].find(user: @new_resource.users, db: @new_resource.database).count
  @current_resource.exists = client_count.positive? ? true : false
end
