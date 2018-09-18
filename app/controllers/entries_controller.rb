class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to root_path, notice: 'Zapisano wpis.'
    else
      render :new
    end
  end

  def entry_params
    params.require(:entry).permit(:job_type_id)
  end
end
