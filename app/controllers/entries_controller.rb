class EntriesController < ApplicationController
    def index
        @entries = Entry.all
    end

    def new
        @entry = Entry.new
    end

    def create
        @entry = Entry.new(entry_params)

        @entry.start_time = DateTime.now

        if @entry.save
            redirect_to @entry
        else
            render 'new'
        end
    end 

    def show
        @entry = Entry.find(params[:id])
        if @entry.end_time
           diff = @entry.end_time - @entry.start_time
           seconds = diff % 60.to_i
           minutes = (diff / 60) % 60.to_i
           hours = (diff / 60) / 60.to_i
           @elapsed_time = "%02d:%02d:%02d" % [hours, minutes, seconds]
        end
    end

    def update
        @entry = Entry.find(params[:id])
        @entry.end_time = DateTime.now

        if @entry.save
            redirect_to @entry
        else
            flash[:notice] = "An error occurred while trying to stop time."
        end
    end

    private
        def entry_params
            params.require(:entry).permit(:customer_number)
        end

end
