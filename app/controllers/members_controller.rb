class MembersController < ApplicationController
  #before_filter :checkTopManager,:except=>[:public, :show] 

  def public
    #@members = Member.all.order(:job)
    #@members = [Member.where("job = 'Designer'"), Member.where("job = 'Marketing'"), Member.where("job = 'Programmer'")]

    @members = {'Designer' => Member.where("job = 'Designer'"),
		'Marketing' => Member.where("job = 'Marketing'"), 
		'Programmer' => Member.where("job = 'Programmer'")}	
  end

  def index
    @members = {'Designer' => Member.where("job = 'Designer'"),
		'Marketing' => Member.where("job = 'Marketing'"), 
		'Programmer' => Member.where("job = 'Programmer'")}	
    #@members = Member.all
    #.page(params[:page]).per(15)                                                               
  end

  def new 
    @member = Member.new
    render "_form"
  end 

  def create
    @member = Member.new(member_params)
    @member.save

    redirect_to members_url
  end 

  def show
    @member = Member.find(params[:id])
  end 

  def edit
    @member = Member.find(params[:id])
    render "_form"
  end 

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)

    redirect_to member_url(@member)
  end 

  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    redirect_to members_url
  end 

  private

  def member_params
    params.require(:member).permit(:name, :nickname, :job, :department, :fb, :email, :motivation, :others, :member_image)
  end 

end
