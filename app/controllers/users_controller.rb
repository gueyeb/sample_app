# -*- coding: utf-8 -*-
class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @titre = @user.nom
  end

  def new
    @user = User.new
    @titre = "Inscription"
  end

  def create
    @user = User.new(params[:user])

    #Rajoutées par moi
    #Les deux lignes suivantes servent à réinitialiser le pass dans le champ de texte.
    @user.password = nil
    @user.password_confirmation = nil

    if @user.save
      #Traite un scuccés d'enregistrement.
      sign_in @user
      flash[:success] = "Bienvenue dans l'Application Exemple!"
      redirect_to @user
    else
      @titre = "Sign up"
      render 'new'
      #en cas d'échec, remontre le formulaire pour saisie des données.
    end
  end
end
