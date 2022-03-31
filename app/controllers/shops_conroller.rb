class ShopsController < ApplicationController
  def show
    @content = @shop.pages.where(page_type: CGI.escape(params[:page])) ||
               @shop.pages.where(page_type: :home)
  end
end