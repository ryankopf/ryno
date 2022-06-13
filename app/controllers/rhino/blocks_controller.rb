require_dependency "rhino/application_controller"

module Rhino
  class BlocksController < ApplicationController
    before_action :must_be_admin
    before_action :set_block, only: [:show,:update,:destroy]
    before_action :set_page, only: [:new]

    # GET /blocks
    def index
      @blocks = Block.all
    end

    # GET /blocks/1
    def show
      respond_to do |format|
        format.html { }
        format.turbo_stream {
          render turbo_stream: turbo_stream.append("page_#{@block.page.id}_blockform", partial: 'show', locals: {block: @block})
        }
      end
    end

    def new
      @block = @page.blocks.create
      respond_to do |format|
        format.html { redirect_to @block }
        format.turbo_stream {
          render turbo_stream: turbo_stream.append("page_#{@page.id}_blockform", partial: 'show', locals: {block: @block})
        }
      end
    end

    def update
      if @block.update(block_params)
        redirect_to @block
      else
        render :edit
      end
    end

    def destroy
      @page = @block.page
      @block.destroy
      respond_to do |format|
        format.html { redirect_to page_url(@page), notice: 'Block Removed' }
        format.json { head :no_content }
        #format.turbo_stream { render turbo_stream: turbo_stream.prepend('posts', partial: 'post') }
        format.turbo_stream { render turbo_stream: turbo_stream.remove("block_#{@block.id}") }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_block
        @block = Block.find(params[:id])
      end
      def set_page
        @page = Page.find(params[:page_id])
      end

      # Only allow a list of trusted parameters through.
      def block_params
        params.require(:block).permit(:page_id, :block_id, :blocks_order, :block_type, :css_classes, :dont_contain, :content)
      end
  end
end
