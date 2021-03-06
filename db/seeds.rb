# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

module SeedData
  def self.extended(object)
    object.instance_exec do
      ActiveRecord::Base.connection.execute("
        TRUNCATE game_genres;
        TRUNCATE games CASCADE;
        TRUNCATE genres CASCADE;
      ")

      # Users
      unless User.find_by(email: "admin@email.com")
        User.create(
          email: "admin@email.com",
          date_of_birth: "01/01/1980",
          password: "123456",
          password_confirmation: "123456",
          is_admin: true,
          first_name: "Test",
          last_name: "Testerson",
          address_line1: "1 Test Street",
          address_line2: "Testing Hill",
          address_line3: "Test Village",
          town_city: "Test Town",
          county: "Testshire",
          postcode: "T1 1TT",
        )
      end
      user = User.find_by(email: "admin@email.com")

      # Games
      final_fantasy_xv = Game.create!({
        title: "Final Fantasy XV",
        description: "An open world action role-playing game where players take"\
          "control of main protagonist Noctis Lucis Caelum during his journey across"\
          "the world of Eos. While accompanied by his three companions Gladiolus, Ignis"\
          "and Prompto, Noctis is the only character directly controlled by the player:"\
          "he can navigate through simple movement, jump over small obstacles, sprint"\
          "for a limited time, and perform context-based actions such as taking cover"\
          "behind objects.",
        image1: "final_fantasy_xv.jpg",
        image2: "final_fantasy_xv_2.jpg",
        release_date: "29/11/2016",
        price: 40,
        players: 1,
        listed: true
      })
      rise_of_the_tomb_raider = Game.create!({
        title: "Rise of the Tomb Raider",
        description: "A third-person action-adventure game that features similar"\
          "gameplay found in 2013's Tomb Raider. Players control Lara Croft through"\
          "various environments, battling enemies, and completing puzzle platforming"\
          "sections, while using improvised weapons and gadgets in order to progress"\
          "through the story.",
        image1: "rise_of_the_tomb_raider.jpg",
        image2: "rise_of_the_tomb_raider_2.jpg",
        release_date: "13/11/2015",
        price: 30,
        players: 1,
        listed: true
      })
      journey = Game.create!({
        title: "Journey",
        description: "In Journey, the player takes the role of a robed figure in a"\
          "desert. After an introductory sequence, the player is shown the robed figure"\
          "sitting in the sand, with a large mountain in the distance. The path towards"\
          "this mountain, the ultimate destination of the game, is subdivided into"\
          "several sections traveled through linearly.",
        image1: "journey.jpg",
        image2: "journey_2.jpg",
        release_date: "14/12/2012",
        price: 12,
        players: 1,
        listed: true
      })

      # Genres
      action_genre = Genre.create(name: "Action")
      role_playing_genre = Genre.create(name: "Role-playing")
      adventure_genre = Genre.create(name: "Adventure")

      # GameGenres
      GameGenre.create(game_id: final_fantasy_xv.id, genre_id: action_genre.id)
      GameGenre.create(game_id: final_fantasy_xv.id, genre_id: role_playing_genre.id)
      GameGenre.create(game_id: rise_of_the_tomb_raider.id, genre_id: action_genre.id)
      GameGenre.create(game_id: rise_of_the_tomb_raider.id, genre_id: adventure_genre.id)
      GameGenre.create(game_id: journey.id, genre_id: adventure_genre.id)

      # Order
      order = Order.create(
        first_name: user.first_name,
        last_name: user.last_name,
        address_line1: user.address_line1,
        address_line2: user.address_line2,
        address_line3: user.address_line3,
        town_city: user.town_city,
        county: user.county,
        postcode: user.postcode,
        user_id: user.id
      )

      # Items in order
      CartGame.create(game_id: final_fantasy_xv.id, order_id: order.id)
    end
  end
end

extend SeedData if ARGV.include?("db:seed")
