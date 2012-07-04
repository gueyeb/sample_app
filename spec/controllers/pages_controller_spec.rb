# -*- coding: utf-8 -*-
require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    @base_title = "Simple App du Tutoriel Ruby on Rails"
  end
  
  describe "GET 'home'" do
    it "devrait réussir" do
      get 'home'
      response.should be_success
    end
    
    it "devrait avoir le bon titre" do
      get 'home'
      response.should have_selector("title",
                                    :content => @base_title + " | Accueil")
    end
  end
  
  describe "GET 'contact'" do
    it "devrait réussir" do
      get 'contact'
      response.should be_success
    end
    
    it "devrait avoir le bon titre" do
      get 'contact'
      response.should have_selector("title",
                                    :content =>
                                    @base_title + " | Contact")
    end
  end
  
  describe "GET 'about'" do
    it "devrait réussir" do
      get 'about'
      response.should be_success
    end
    
    it "devrait avoir le bon titre" do
      get 'about'
      response.should have_selector("title",
                                    :content =>
                                    @base_title + " | A Propos")
    end
  end

  describe "GET 'help'" do
    it "devrait réussir" do
      get 'help'
      response.should be_success
  end

    it "devrait avoir le bon titre" do
      get 'help'
      response.should have_selector("title",
                                    :content =>
                                    @base_title + " | Aide")
    end
  end
end
