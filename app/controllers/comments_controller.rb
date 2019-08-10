class CommentsController < ApplicationController
  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  end

  def show
  	puts "*"*99
    puts params.inspect
    puts "*"*99
 
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
  end

  def new
  	@c = Comment.new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end
  

  def create
    
      @c = Comment.new(content:params[:q],user_id: User.last.id, gossip_id: params[:gossip_id])

      if @c.save
       redirect_to gossip_path(params[:gossip_id])
      else

        redirect_to gossip_path(params[:gossip_id])
  	   end
    
  end

  def edit
 
  end

  def update
  	 a = Comment.find(params[:id])
  	if a.update(content: params[:content])
  		redirect_to gossip_path(params[:gossip_id])
  	end
  end

  def destroy
   	if Comment.find(params[:id]).destroy
   		redirect_to gossip_path(params[:gossip_id])
   	end

  end
end
