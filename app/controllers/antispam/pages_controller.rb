require_dependency "rhino/application_controller"

module Rhino
  class PagesController < ApplicationController
    before_action :must_be_editor
    before_action :set_page, only: [:show, :edit, :update, :destroy]

    def index
      @pages = Page.all
    end

    # GET /pages/1
    def show
      respond_to do |format|
        format.jpeg do
          image = @challenge.get_image
          render content_type: 'image/jpeg', plain: image.jpegsave_buffer
        end
      end
    end

    # GET /pages/new
    def new
      # use in the future for changing code
    end

    # PATCH/PUT /pages/1
    def update
      if @challenge.validate?(params[:challenge][:answer])
        a = Rhino::Ip.find_or_create_by(address: request.remote_ip, provider: 'httpbl')
        before = a.threat
        a.threat = [(a.threat || 0) - 25, 0].max
        c = Clear.create(ip: request.remote_ip, answer: params[:challenge][:answer], result: 'Passed', threat_before: before, threat_after: a.threat)
        a.expires_at = 1.hour.from_now
        a.save
        redirect_to '/'
      else
        c = Clear.create(ip: request.remote_ip, answer: params[:challenge][:answer], result: 'Failed')
        redirect_to '/rhino/validate', notice: 'Invalid answer.'
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_page
        @page = Page.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def page_params
        params.require(:page).permit(:answer, :code)
      end
  end
end
