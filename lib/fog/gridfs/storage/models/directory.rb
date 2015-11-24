require 'fog/core/model'
require 'fog/gridfs/storage/models/files'

module Fog
  module Storage
    class Gridfs
      class Directory < Fog::Model
        identity :key, aliases: ['path']

        def files
          @files ||= Fog::Storage::Gridfs::Files.new(
            directory: self,
            service: service
          )
        end

        def save
          requires :key
          true
        end

        def destroy
        end
      end
    end
  end
end