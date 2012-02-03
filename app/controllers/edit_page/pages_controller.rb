module EditPage
  class PagesController < ApplicationController
    layout nil
    
    def index
      @pages = Page.where(:active => true)
    end
    
    def new
      @page = Page.new(params[:page])
    end
    
    def create
      @page = Page.new(params[:page])
      if @page.save
        flash[:success] = "Successfully created page."
        respond_to do |format|
          format.html
          format.js
        end
      else
        render :action => :edit
      end
    end
  
    def edit
      @page = Page.find(params[:id])
      respond_to do |format|
        format.html
        format.js
      end
    end
    
    def show
      @page = Page.find(params[:id])
    end
    
    def update
      @page = Page.find(params[:id])
      if @page.update_attributes(params[:page])
        flash[:success] = "Successfully updated page."
        respond_to do |format|
          format.html
          format.js
        end
      else
        render :action => :edit
      end
    end
    
    def destroy
      @page = Page.find(params[:id])
      @page.active = false
      @page.save!
      flash[:success] = "Successfully deleted page."
      respond_to do |format|
        format.html
        format.js
      end
    end

  end
end
