class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def term
  end

  def policy
  end
  
  def contact
  end

  def category
    if params[:category_id]
    @tutorials = Tutorial.where(:category_id => params[:category_id])
  else
    @tutorials = Tutorial.all
  end
  end

  def university
     if params[:university_id]
    @tutorials = Tutorial.where(:university_id => params[:university_id])
  else
    @tutorials = Tutorial.all
  end
  end

  def subject
     if params[:subject_id]
    @tutorials = Tutorial.where(:subject_id => params[:subject_id])
  else
    @tutorials = Tutorial.all
  end
  end
end
