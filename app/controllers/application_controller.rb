class ApplicationController < ActionController::Base
  before_action :set_shop

  private

  def set_shop
    @shop = Shop.find_by(domain: domain_params)
  end

  def domain_params
    CGI.escape request.domain
  end
end
