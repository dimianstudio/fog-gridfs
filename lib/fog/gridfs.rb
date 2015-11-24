require 'fog/core'
require 'fog/gridfs/version'

module Fog
  module Storage
    autoload :Gridfs, 'fog/gridfs/storage'
  end

  module Gridfs
    extend Fog::Provider

    service(:storage, 'Storage')
  end
end
