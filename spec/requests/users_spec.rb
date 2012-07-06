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
end
