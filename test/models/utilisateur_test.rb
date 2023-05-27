require "test_helper"

class UtilisateurTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @utilisateur = Utilisateur.new(nom:"prenom1 Nom1",
      email:"prenom1@example.com",  
      password: "pppppp", password_confirmation:"pppppp")
  
  end



  test "nom doit etre present" do
    @utilisateur.nom = "a"*51         #nom utilisateur il faut qu'il soit non vide
    assert_not @utilisateur.valid?    
  end

  test "email doit etre present" do
    @utilisateur.email = "a"*244+"@example.com"         #nom utilisateur il faut qu'il soit non vide
    assert_not @utilisateur.valid?    
  end
  test "email validation doit accepter les emails valides" do
    valid_addresses=%w[a@example.com AAA@example.COM]
    valid_addresses.each do |valid_address|
      @utilisateur.email=valid_address
      assert @utilisateur.valid?, "#{valid_address.inspect}"
    end
  end    


end
