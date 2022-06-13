require_dependency "rhino/application_controller"

module Rhino
  class BlocksController < ApplicationController
    before_action :must_be_admin
    before_action :set_block, only: [:show,:update,:destroy]

    # GET /blocks
    def index
      @blocks = Block.all
    end

    # GET /blocks/1
    def show
    end

    def new
      @block = Block.create(page_id: params[:page_id])
      redirect_to @block
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
        format.html { redirect_to @page, notice: 'Block Removed' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_block
        @block = Block.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def block_params
        params.require(:block).permit(:page_id, :block_id, :blocks_order, :block_type, :css_classes, :dont_contain, :content)
      end
  end
end
