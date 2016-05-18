class PricesController < ApplicationController
   def new
   end

   def create
       render plain: params[:history].inspect
   end
end
