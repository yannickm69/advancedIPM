# frozen_string_literal: true
class SchedulesController < ApplicationController
  def index
    @techs = Technician.all
    @work = WorkOrder.includes(:technician, :location).all
  end

  def timeleft

    prev = WorkOrder.where('time(time) < ?', 
                           DateTime.parse(params[:t]).to_s(:time)).where(technician_id: params[:techid]).order('time').last
    nxt = WorkOrder.where('time(time) > ?', 
                          DateTime.parse(params[:t]).to_s(:time)).where(technician_id: params[:techid]).order('time').first

    @prev = prev.present? ? prev.time.to_s(:time) : DateTime.parse(params[:t]).to_s(:time)
    @next = nxt.present? ? nxt.time.to_s(:time) : 'NA'
    if prev.present? && nxt.present?
      @duration = prev.duration
      @time_before_next = (nxt.time - (prev.time + prev.duration.minute)) / 60
    else
      @duration = '0'
      @time_before_next = 'NA'
    end

    render 'timeleft', layout: false
  end
end
