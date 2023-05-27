class UtilisateursController < ApplicationController

before_action :authenticate,:only => [:index,:edit,:update,:destroy]
before_action :bon_utilisateur,only: [:edit,:update]

  def index 
    @utilisateurs=Utilisateur.all 
  end   

  def new
    @utilisateur=Utilisateur.new
  end

  def show 
    @utilisateur=Utilisateur.find(params[:id])
    @articles=@utilisateur.articles
  end

  def create 
     @utilisateur=Utilisateur.new(utilisateur_params)  #recupere les donnees envoyes a l'utilisateur
     if @utilisateur.save  #execute dans la base
        flash[:success]="Bienvenue!"
          redirect_to @utilisateur
        #A faire.
     else 
      render 'new'
     end
  end     

  def edit 
    @utilisateur=Utilisateur.find(params[:id])
  end  

  def update
    @utilisateur = Utilisateur.find(params[:id])  
    if @utilisateur.update(utilisateur_params)
        flash[:success] = "Profile Actualisé!"
        redirect_to @utilisateur
    else
        render 'edit'
    end
  end

  def destroy
    Utilisateur.find(params[:id]).destroy
	flash[:success] = "Utilisateur supprimé"
	redirect_to root_url
  end
 



  private 
    def utilisateur_params    #pour securiser les donnes
      params.require(:utilisateur).permit(:nom,:email,:password,:password_confirmation)
    end  
    
   
    
    def bon_utilisateur
        @utilisateur = Utilisateur.find(params[:id])
        redirect_to(root_url) unless @utilisateur == @utilisateur_courant
    end
    
   


end
