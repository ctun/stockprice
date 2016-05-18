class HistoriesController < ApplicationController
   def show
      @history = History.find( params[:id] )
   end

   def index
      @histories = History.all
   end

   def new
      @history = History.new
   end

   def create_check
      render plain: params[:history][:symbol].inspect
   end

   def create
      @histories = History.new(history_params)
      @histories.save

      redirect_to @histories
   end

   def getPrices
      objs = History.where(:symbol => params[:symbol])
      @prices = objs.map {|x| x.price}.last(30)
      render json: @prices
   end

   private
      def history_params
         params.require(:history).permit(:symbol, :price)
      end
end
