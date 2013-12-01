class AddonsController < ApplicationController
    def new
        @entry = Entry.find(params[:entry_id])
        @addons = Addon.new
        @addons.build_item()
        @items = Item.all
    end

    def create
        puts params

        @addons = Addon.new(addons_params)
        @addons.compute_amount
        entry = Entry.find(params[:entry_id])
        @addons.entry = entry

        if @addons.save
            redirect_to entry_path(entry)
        else
            @items = Item.all
            render 'new'
        end
    end

    private
        def addons_params
            params.require(:addon).permit(:quantity, :item_id)
        end
end