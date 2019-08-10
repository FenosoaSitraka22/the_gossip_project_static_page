class GossipsController < ApplicationController
 

  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  end

  def show
  	
    
 
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
  end

  def new
     @t =Array.new
     Tag.all.each do |ta|
      @t << ta.content
    end                        
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create

                                                                                                             
      a = User.find(11)
      puts "*"*90
      puts params[:credit_card]
      puts "*"*90
      @g = Gossip.new( 'title' => params[:title],
                       'content' => "#{params[:body]} #{params[:selected_tag]}"  ,'user' => a)

      if @g.save
       redirect_to gossips_path
      else
        render 'new'
  end
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
  end

  def edit
    @g = Gossip.find(params[:id])
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    @g = Gossip.find(params[:id])
    
   
  if @g.update('title'=> params[:title],'content' =>params[:body])
    puts "tafidytra"
    redirect_to gossip_path
  else
    render :edit
  end



    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    @g = Gossip.find(params[:id])
     puts "*"*50
      puts Comment.where(gossip_id: @g.id).destroy_all
      @g.destroy
       puts "*"*50 
      redirect_to gossips_path

    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end

  
end
