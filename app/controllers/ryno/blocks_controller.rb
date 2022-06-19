require_dependency "ryno/application_controller"

module Ryno
  class BlocksController < ApplicationController
    before_action :must_be_editor
    before_action :set_block, only: [:show,:update,:destroy,:makecolumns]

    # GET /blocks
    def index
      @blocks = Block.all
    end

    # GET /blocks/1
    def show
      @page = @block.page
      respond_to do |format|
        format.html { }
        format.turbo_stream {
          render turbo_stream: turbo_stream.append("page_#{@block.page.id}_blockform", partial: 'show', locals: {block: @block})
        }
      end
    end

    def new
      if params[:page_id]
        new_page
      elsif params[:block_id]
        new_block
      end
    end

    def new_page
      @page = Page.find(params[:page_id])
      @block = @page.blocks.create
      respond_to do |format|
        format.html { redirect_to @block }
        format.turbo_stream {
          render turbo_stream: turbo_stream.append("page_#{@page.id}_blockform", partial: 'show', locals: {block: @block})
        }
        format.js {}
      end
    end

    def new_block
      @parentblock = Block.find(params[:block_id])
      @block = @parentblock.blocks.create
      respond_to do |format|
        format.html { redirect_to @block }
        format.turbo_stream {
          render turbo_stream: turbo_stream.append("block_#{@parentblock.id}_blockform", partial: 'show', locals: {block: @block})
        }
        format.js {}
      end
    end

    def makecolumns
      if @block.blocks.size < 3
        @block.update(block_type: 'columns', css_classes: 'row')
        @block.blocks.create(css_classes: 'col-3')
        @block.blocks.create(css_classes: 'col-9')
        redirect_to @block
      else
        redirect_to @block
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

      # Only allow a list of trusted parameters through.
      def block_params
        params.require(:block).permit(:page_id, :block_id, :blocks_order, :block_type, :css_classes, :dont_contain, :content)
      end
  end
end
