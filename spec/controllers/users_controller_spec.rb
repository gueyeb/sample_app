# -*- coding: utf-8 -*-
require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'new'" do
    it "devrait réussir" do
      get 'new'
      response.should be_success
    end

    it "devrait avoir le titre adéquat" do
      get 'new'
      response.should have_selector("title",
                                    :content => "Inscription")
    end
  end
end
