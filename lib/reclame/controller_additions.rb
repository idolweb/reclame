require 'active_support/concern'

module Reclame
  module ControllerAdditions
    extend ActiveSupport::Concern

    included do
      helper_method :reclame
      def reclame
        return false unless request && (request.get? || request.head?)
        request_uri = request.fullpath

        tmp_proc = current_reclamation.proc_for_request(request_uri)

        tmp_proc.call(self)
        "Hello from reclame : #{request_uri}"
      end

      def current_reclamation
        @current_reclamation ||= ::Slogan.new
      end
    end
  end
end

if defined? ActionController::Base
  ActionController::Base.class_eval do
    include Reclame::ControllerAdditions
  end
end
