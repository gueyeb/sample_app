# -*- coding: utf-8 -*-
class User < ActiveRecord::Base 
  attr_accessor :password
  attr_accessible :nom, :email, :password, :password_confirmation

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :nom,  :presence => true,
  :length   => { :maximum => 50 }

  validates :email, :presence => true,
  :format   => { :with => email_regex },
  :uniqueness => { :case_sensitive => false }

  # Crée automatique l'attribut virtuel 'password_confirmation'.
  validates :password, :presence     => true,
  :confirmation => true,
  :length       => { :within => 6..40 }

  ##
  before_save :encrypt_password

  private

    def encrypt_password
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      string # Implémentation provisoire !
    end
end

# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  nom                :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#

