# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

module SeedData
  def self.extended(object)
    object.instance_exec do

      unless User.find_by(email: "admin@email.com")
        User.create(email: "admin@email.com", date_of_birth: "01/01/1980", password: "123456", password_confirmation: "123456")
      end

      ActiveRecord::Base.connection.execute("TRUNCATE games")

      Game.create!({
        title: "Final Fantasy XV",
        description: %{An open world action role-playing game where players take 
          control of main protagonist Noctis Lucis Caelum during his journey across 
          the world of Eos. While accompanied by his three companions Gladiolus, Ignis 
          and Prompto, Noctis is the only character directly controlled by the player: 
          he can navigate through simple movement, jump over small obstacles, sprint 
          for a limited time, and perform context-based actions such as taking cover 
          behind objects.},
        image1: "final_fantasy_xv.jpg",
        release_date: "29/11/2016",
        price: 40,
        players: 1
      })
      Game.create!({
        title: "Rise of the Tomb Raider",
        description: %{A third-person action-adventure game that features similar 
          gameplay found in 2013's Tomb Raider. Players control Lara Croft through 
          various environments, battling enemies, and completing puzzle platforming 
          sections, while using improvised weapons and gadgets in order to progress 
          through the story.},
        image1: "rise_of_the_tomb_raider.jpg",
        release_date: "13/11/2015",
        price: 30,
        players: 1
      })
      Game.create!({
        title: "Journey",
        description: %{In Journey, the player takes the role of a robed figure in a 
          desert. After an introductory sequence, the player is shown the robed figure 
          sitting in the sand, with a large mountain in the distance. The path towards 
          this mountain, the ultimate destination of the game, is subdivided into 
          several sections traveled through linearly.},
        image1: "journey.jpg",
        release_date: "14/12/2012",
        price: 12,
        players: 1
      })
    end
  end
end

extend SeedData if ARGV.include?("db:seed")
