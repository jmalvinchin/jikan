class ConfigurationsController < ApplicationController

  def index
    @configuration = ::Configuration.find(1)
    redirect_to @configuration
  end

  def show
    @configuration = ::Configuration.find(1)
  end

  def edit
    @configuration = ::Configuration.find(1)
  end

  def update
    @configuration = ::Configuration.find(1)

    if @configuration.update_attributes(configuration_params)
      redirect_to @configuration
    else
      render 'edit'
    end
  end

    private
        def configuration_params
            params.require(:configuration).permit(:price)
        end
end
