# -*- coding: utf-8 -*-
require 'spec_helper'

describe "Users" do

  describe "Une inscription" do
    
    describe "ratée" do
      
      it "ne devrait pas créer un nouvel utilisateur" do
        lambda do
          visit signup_path
          fill_in :user_nom, :with => ""
          fill_in :user_email, :with => ""
          fill_in :user_password, :with => ""
          fill_in :user_password_confirmation, :with => ""
          click_button
          response.should render_template('users/new')
          response.should have_selector("div#error_explanation")
        end.should_not change(User, :count)
      end
    end
    
    describe "réussie" do
      
      it "devrait créer un nouvel utilisateur" do
        lambda do
          visit signup_path
          fill_in :user_nom, :with => "Example User"
          fill_in :user_email, :with => "user@example.com"
          fill_in :user_password, :with => "foobar"
          fill_in :user_password_confirmation, :with => "foobar"
          click_button
          response.should have_selector("div.flash.success",
                                        :content => "Bienvenue")
          response.should render_template('users/show')
        end.should change(User, :count).by(1)
      end
    end
  end
  
##
  
  describe "identification/déconnexion" do
    
    describe "l'échec" do
      it "ne devrait pas identifier l'utilisateur" do
        visit signin_path
        fill_in "eMail",    :with => ""
        fill_in "Mot de passe", :with => ""
        click_button
        response.should have_selector("div.flash.error", :content => "Invalid")
      end
    end
    
    describe "le succès" do
      it "devrait identifier un utilisateur puis le déconnecter" do
        user = Factory(:user)
        visit signin_path
        fill_in "eMail",    :with => user.email
        fill_in "Mot de passe", :with => user.password
        click_button
        controller.should be_signed_in
        click_link "Déconnexion"
        controller.should_not be_signed_in
      end
    end
  end

end
