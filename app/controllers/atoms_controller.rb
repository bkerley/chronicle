class AtomsController < ApplicationController
  # GET /atoms
  # GET /atoms.xml
  def index
    @atoms = Atom.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @atoms }
    end
  end

  # GET /atoms/1
  # GET /atoms/1.xml
  def show
    @atom = Atom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @atom }
    end
  end

  # GET /atoms/new
  # GET /atoms/new.xml
  def new
    @atom = Atom.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @atom }
    end
  end

  # GET /atoms/1/edit
  def edit
    @atom = Atom.find(params[:id])
  end

  # POST /atoms
  # POST /atoms.xml
  def create
    @atom = Atom.new(params[:atom])

    respond_to do |format|
      if @atom.save
        flash[:notice] = 'Atom was successfully created.'
        format.html { redirect_to(@atom) }
        format.xml  { render :xml => @atom, :status => :created, :location => @atom }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @atom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /atoms/1
  # PUT /atoms/1.xml
  def update
    @atom = Atom.find(params[:id])

    respond_to do |format|
      if @atom.update_attributes(params[:atom])
        flash[:notice] = 'Atom was successfully updated.'
        format.html { redirect_to(@atom) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @atom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /atoms/1
  # DELETE /atoms/1.xml
  def destroy
    @atom = Atom.find(params[:id])
    @atom.destroy

    respond_to do |format|
      format.html { redirect_to(atoms_url) }
      format.xml  { head :ok }
    end
  end
end
