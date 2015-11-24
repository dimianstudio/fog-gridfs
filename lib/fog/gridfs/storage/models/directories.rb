require 'fog/core/collection'
require 'fog/gridfs/storage/models/directory'

module Fog
  module Storage
    class Gridfs
      class Directories < Fog::Collection
        model Fog::Storage::Gridfs::Directory

        def all
          load([{ key: '/' }])
        end

        def get(key, options = {})
        #   data = service.client.metadata(key)
        #   directory = new(data)
        #   directory.files.load(data['contents'])
        #   directory
        # rescue DropboxError
        #   nil
        end
      end
    end
  end
end