require 'open-uri'
class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @category = Category.find(params[:id])
    @activities = Activity.where(category: @category)
    # @activities = Activity.joins(:tags).where(category: @category).where("tags.name ILIKE ?", params[:vibe])
    search_filter
  end

  private

  def search_filter
    if params[:number_of_people].present? || params[:who_are_you_with].present? || params[:location].present? || params[:vibe].present?
      search = params[:number_of_people].downcase + " " + params[:who_are_you_with].downcase + " " + params[:location].downcase + " " + params[:vibe].downcase
      @activities = Activity.search_by_activity_info(search).where(category: @category)
    end
  end
end
