require 'journey'

module Reclame
  module Reclamation


    def advertize(pattern, &block)
      @router ||= begin
                    routes = Journey::Routes.new
                    Journey::Router.new(routes, {})
                  end
      @route_hash ||= {}
      path = Journey::Path::Pattern.new pattern
      route = @router.routes.add_route(nil, path, {}, {}, {})
      @route_hash[route] = block

    end
  end
end
