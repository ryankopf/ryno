require_dependency "ryno/application_controller"

module Ryno
  class PagesController < ApplicationController
    before_action :must_be_editor
    before_action :set_page, only: [:show, :publish, :edit, :update, :destroy]

    def index
      @pages = Page.all
    end

    def show
      render :show
    end

    def new
      @page = Page.new
    end

    def edit
    end

    def publish
      @page.render_content(request)
      @page.publish!
      redirect_to @page
    end

    def create
      @page = Page.create(page_params)
      redirect_to @page
    end

    # PATCH/PUT /pages/1
    def update
      if @page.update(page_params)
        if (params[:publish])
          @page.render_content(request)
          @page.publish!
        end
        redirect_to edit_page_path(@page)
      else
        render :edit
      end

    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_page
        @page = Page.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def page_params
        params.require(:page).permit(:blocks_order, :url, :title, :seo_title, :description, :redirect_to, :css_classes)
      end
  end
end
