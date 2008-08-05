class ServicesController < ApplicationController
	acts_as_service_document

  def index
      render :xml => service_document
  end
end
