require 'mongo'

module Fog
  module Storage
    class Gridfs < Fog::Service
      requires :urls, :database

      model_path 'fog/gridfs/storage/models'
      collection  :directories
      model       :directory
      model       :file
      collection  :files

      class Real
        def initialize(options={})
          @client = Mongo::Client.new(options[:urls], database: options[:database])
        end

        def method_missing(*args, &block)
          if @client.database.fs.respond_to?(args.first)
            @client.database.fs.send(*args, &block)
          else
            super
          end
        end
      end
    end
  end
end