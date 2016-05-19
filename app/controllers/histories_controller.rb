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

   #
   # assumes one price entry per day.

   def getPrices
      @prices = History.where(:symbol => params[:symbol]).last(30).map {|x| x.price}
      render json: @prices
   end

   private
      def history_params
         params.require(:history).permit(:symbol, :price)
      end
end
