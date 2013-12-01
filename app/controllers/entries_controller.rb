class EntriesController < ApplicationController
    before_filter :load_entries_service

    def index
        @entries = Entry.all
    end

    def new
        @entry = Entry.new
    end

    def create

        @entry = Entry.new
        @entry.customer_number = @entries_service.generate_id
        @entry.start_time = DateTime.now

        if @entry.save
            redirect_to @entry
        else
            render 'index'
        end
    end 

    def show
        @entry = Entry.find(params[:id])
    end

    def update
        @entry = Entry.find(params[:id])
        @entry.end_time = DateTime.now
        price = ::Configuration.find(1).price

        addon_total = @entries_service.compute_addon_cost(@entry)
        time_total = @entries_service.compute_time_cost(@entry, price)

        @entry.total_cost = addon_total + time_total

        if @entry.save
            redirect_to @entry
        else
            flash[:notice] = "An error occurred while trying to stop time."
        end
    end

    def load_entries_service(service = EntriesService.new)
        @entries_service ||= service
    end

    private
        def entry_params
            params.require(:entry).permit(:customer_number)
        end

end
