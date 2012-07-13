# -*- coding: utf-8 -*-
module ApplicationHelper

  def titre
    #etourner un titre basé sur la page
    base_titre = "Simple App du Tutoriel Ruby on Rails"
    if @titre.nil?
      base_titre
    else
      "#{base_titre} | #{@titre}"
    end
  end

  def logo
    #fill in
    logo = image_tag("logo.png", :alt => "Application exemple", :class => "round")
  end
end
