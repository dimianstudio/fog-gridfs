require 'mongo'

module Fog
  module Storage
    class Gridfs < Fog::Service
      # autoload :Directories, ::File.expand_path('../local/models/directories', __FILE__)
      # autoload :Directory, ::File.expand_path('../local/models/directory', __FILE__)
      # autoload :File, ::File.expand_path('../local/models/file', __FILE__)
      # autoload :Files, ::File.expand_path('../local/models/files', __FILE__)

      # requires :local_root
      # recognizes :endpoint, :scheme, :host, :port, :path

      # model_path 'fog/storage/local/models'
      # collection  :directories
      # model       :directory
      # model       :file
      # collection  :files

      # require 'uri'

      # class Mock
      #   attr_reader :endpoint

      #   def self.data
      #     @data ||= Hash.new do |hash, key|
      #       hash[key] = {}
      #     end
      #   end

      #   def self.reset
      #     @data = nil
      #   end

      #   def initialize(options={})
      #     Fog::Mock.not_implemented

      #     @local_root = ::File.expand_path(options[:local_root])

      #     @endpoint = options[:endpoint] || build_endpoint_from_options(options)
      #   end

      #   def data
      #     self.class.data[@local_root]
      #   end

      #   def local_root
      #     @local_root
      #   end

      #   def path_to(partial)
      #     ::File.join(@local_root, partial)
      #   end

      #   def reset_data
      #     self.class.data.delete(@local_root)
      #   end

      #   private
      #   def build_endpoint_from_options(options)
      #     return unless options[:host]

      #     URI::Generic.build(options).to_s
      #   end
      # end

      # https://docs.mongodb.org/ecosystem/tutorial/ruby-driver-tutorial/#gridfs

      class Real
        attr_reader :client

        def initialize(options={})
          @client = Mongo::Client.new(['localhost:27017'], database: 'streamline_development')
        end
      end
    end
  end
end