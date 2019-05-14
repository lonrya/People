class PeopleController < ApplicationController
  def index
    @people = Person.all
    #render :index 
  end

  def show
    @people = Person.find(params[:id])
    #render :show
  end

  def create
    @people = Person.new(people_params)

    if @people.save 
      redirect_to people_path 
    else 
      render :new
    end 
  end
  def new 
    @people = Person.new 
  end

  def edit 
  # params = { id: "6" }
  @people = Person.find(params[:id])
  # render :edit
  end 

  def update 
    # params = {id: "6" }
    @people = Person.find(params[:id])
    if @people.update(people_params)
      redirect_to people_path 
    else 
      render :edit
    end
  end
  def destroy
    # params = { id: "6" }
    Person.find(params[:id]).destroy
    redirect_to people_path 
  end 
  private 
  def people_params 
    params.require(:person).permit(:first_name, :last_name, :age, :hair_color, :eye_color, :gender, :alive )
  end 
end
