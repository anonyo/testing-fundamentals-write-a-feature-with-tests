class PeopleController < ApplicationController
  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_attributes)
    after_create_or_updated(:new, "Person created.")
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    show
  end

  def update
    edit.update_attributes(person_attributes)
    after_create_or_updated(:edit, "Person edited.")
  end

  private

  def person_attributes
    params.require(:person).permit(:first_name)
  end

  def after_create_or_updated(template, message)
    if @person.save
      redirect_to @person, notice: message
    else
      render template
    end
  end
end
