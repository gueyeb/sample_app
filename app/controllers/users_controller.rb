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
    if @user.save
      #Traite un scuccés d'enregistrement.
      flash[:success] = "Bienvenue dans l'Application Exemple!"
      redirect_to @user
    else
      @titre = "Inscription"
      render 'new'
      #en cas d'échec, remontre le formulaire pour saisie des données.
    end
  end
end
