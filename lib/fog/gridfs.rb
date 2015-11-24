require 'fog/core'
require 'fog/gridfs/version'

module Fog
  module Storage
    autoload :Gridfs, File.expand_path('../storage/gridfs', __FILE__)
  end

  module Gridfs
    extend Fog::Provider

    service(:storage, 'Storage')
  end
end
