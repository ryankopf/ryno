module Ryno
  class Page < ApplicationRecord
    has_many :blocks
    has_one :publishedpage
    validates :url, presence: true
    validates :title, presence: true
    attr_accessor :rendered_content

    def get_title
      self.title.blank? ? "(untitled)" : self.title
    end
    def publish!
      create_publishedpage! if self.publishedpage.nil?
      self.publishedpage.update(url: self.url, content: self.rendered_content, page_id: self.id, title: self.get_title, seo_title: self.seo_title)
      Rails.application.reload_routes!
    end
    def create_publishedpage!
      Publishedpage.create(url: self.url, content: self.rendered_content, page_id: self.id, title: self.get_title, seo_title: self.seo_title)
      self.reload
    end
    def render_content(request)
      @no_edit_button = true
      self.rendered_content = ApplicationController.new.render_to_string(partial: 'ryno/pages/show', locals: { page: self, request: request, no_edit_button: @no_edit_button })
      #PagesController.show
      #self.blocks.pluck(:content).join('')
    end

  end
end
