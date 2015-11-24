require 'fog/core/collection'
require 'fog/gridfs/storage/models/file'

module Fog
  module Storage
    class Gridfs
      class Files < Fog::Collection
        attribute :directory

        model Fog::Storage::Gridfs::File

        def all
          requires :directory
          load(service.find({}).to_a)
        end

        def get(key, options = {}, &block)
          head(key, options)
        end

        def head(key, options = {})
          requires :directory
          file = service.find(filename: key).first
          file ? new(file) : nil
        end
      end
    end
  end
end