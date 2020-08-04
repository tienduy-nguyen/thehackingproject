class WelcomeController < ApplicationController
  def show
      puts "démarrage"
     @first_name = params[:first_name]
     puts "Ceci est mon super params : #{params}"
     puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans tel champ : #{params["first_name"]}"
  end
end
