class WireframesController < ApplicationController
  def show
    if params[:path].present?
      @wireframe_path = "wireframe_#{params[:path]}"
      render :template => "wireframes/#{params[:path]}"
    else
      render :action => 'index', :layout => 'home'
    end
  end
end
