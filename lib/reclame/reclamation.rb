require 'journey'

module Reclame
  module Reclamation
    def proc_for_request(request)
      route = router.recognize(request)
      @route_hash[route]
    end

    def advertize(pattern, &block)
      @route_hash ||= {}
      path = Journey::Path::Pattern.new pattern
      route = router.routes.add_route(nil, path, {}, {}, {})
      @route_hash[route] = block
    end

    private
    def router
      @router ||= begin
                    routes = Journey::Routes.new
                    Journey::Router.new(routes, {})
                  end
    end
  end
end
