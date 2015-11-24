require 'fog/core/model'

module Fog
  module Storage
    class Gridfs
      class File < Fog::Model
        identity :key, aliases: 'filename'

        attribute :content_length, aliases: 'length', type: :integer
        attribute :content_type, aliases: 'contentType'
        attribute :last_modified, aliases: 'uploadDate'

        def body
          service.find_one(filename: key).try(:data) || attributes[:body] || ''
        end

        def body=(value)
          attributes[:body] = value
        end

        def save(options = {})
          requires :key, :body

          options = {
            filename: key,
            length: body.size,
            content_type: MIME::Types.type_for(key).first.to_s,
          }

          file = if body.is_a?(::File) || body.class.to_s =~ /^Paperclip::.*Adapter/
            Mongo::Grid::File.new(body.read, options)
          else
            Mongo::Grid::File.new(body, options)
          end

          service.insert_one(file)
        end

        def destroy
          requires :key

          file = service.find_one(filename: key)
          service.delete_one(file)

          true
        end
      end
    end
  end
end