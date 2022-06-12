require_dependency "rhino/application_controller"

module Rhino
  class PublishedpagesController < ApplicationController
    before_action :set_page, only: [:show]

    def show
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_clear
        @publishedpage = Publishedpage.find(params[:id])
      end
  end
end
