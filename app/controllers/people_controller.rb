require 'csv'

class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update , :destroy]

  # GET /people or /people.json
  def index
    @people = Person.all
    @person = Person.new
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    #@person = Person.new
    @person = current_user.people.build
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
  end

  # POST /people or /people.json
  def create
    #@person = Person.new(person_params)
    @person = current_user.people.build(person_params)


    respond_to do |format|
      if @person.save
        format.html { redirect_back(fallback_location: people_url, notice: "Person was successfully created.") }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to people_url, notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy!

    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @person = current_user.people.find_by(id: params[:id])
    redirect_to people_path, notice: "Not Authorized To Edit This Person" if @person.nil?

  end



    def upload_csv
      if params[:file].present?
        CSV.foreach(params[:file].path, headers: true) do |row|
          person_attributes = row.to_h.symbolize_keys
          person_attributes[:user_id] = current_user.id
          current_user.people.create(person_attributes)
        end
        redirect_to people_path, notice: "CSV uploaded successfully."
      else
        redirect_to people_path, alert: "Please attach a CSV file."
      end
    rescue CSV::MalformedCSVError => e
      redirect_to people_path, alert: "There was an error processing your CSV file."
    end



    def export_csv
      csv_data = CSV.generate(headers: true) do |csv|
        csv << Person.attribute_names
        current_user.people.find_each do |person|
          csv << person.attributes.values
        end
      end
      send_data csv_data, filename: "people-#{Date.today}.csv"
    end


    def index
      if params[:query].present?
        field = params[:search_field] || 'first_name'
        query = "%#{params[:query]}%"
        @people = Person.where("#{field} LIKE ?", query)
      else
        @people = Person.all
      end
    end










  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:first_name, :last_name, :gender, :age, :user_name, :email, :phone, :address_street, :address_county, :college, :course, :year, :user_id)
    end
end
