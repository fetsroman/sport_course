module Admin
  class WelcomeController < ApplicationController
    before_action :set_welcome

    def index
    end

    def edit
    end

    def update
      respond_to do |format|
        if @welcome.update(welcome_params)
          format.html { redirect_to admin_welcome_index_path, notice: 'Rate was successfully updated.' }
          format.json { render :index, status: :ok, location: @welcome }
        else
          format.html { render :edit }
          format.json { render json: @welcome.errors, status: :unprocessable_entity }
        end
      end
    end

    private
    def set_welcome
      @welcome = Welcome.find_by(id: 1)
    end

    def welcome_params
      params.require(:welcome).permit(:header1, :header2, :header3, :header4, :header5, :header6, :header7, :content1, :content2, :content3, :content4, :content5, :content6, :for_you1, :for_you2, :for_you3, :for_you4, :for_you5, :for_you6, :price, :time, :client_number)
    end
  end
end