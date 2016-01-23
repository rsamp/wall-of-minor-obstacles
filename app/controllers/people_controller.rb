class PeopleController < ApplicationController
  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to list_index_url
    else
      flash[:errors] = @person.errors.full_messages
      redirect_to list_index_url
    end
  end

  def destroy
    @person = Person.find(params[:id])
    if @person.destroy
      redirect_to list_index_url
    else
      flash[:errors] = @person.errors.full_messages
      redirect_to list_index_url
    end
  end

  def update
    @person = Person.find(params[:id])
    if @person.update(person_params)
      redirect_to list_index_url
    else
      flash[:errors] = @person.errors.full_messages
      redirect_to list_index_url
    end
  end

  def add_rejection
    @person = Person.find(params[:person_id])
    @person.increment!(:rejection_count)
    redirect_to list_index_url
  end

  def remove_rejection
    @person = Person.find(params[:person_id])
    @person.decrement!(:rejection_count)
    redirect_to list_index_url
  end

  private


  def person_params
    params.require(:person).permit(:name)
  end
end
