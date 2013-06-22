require 'ruboto/widget'
require 'ruboto/util/toast'
require_relative "person"
require_relative "tournament"

ruboto_import_widgets :EditText, :TextView, :Button, :LinearLayout

# http://xkcd.com/378/

class Fixture10Activity
  def onCreate(bundle)
    super

    handle_click = proc do |view|
      @tv.append "\n#{view.getText}"
      @et.text = @quantity.text
    end

    setContentView(
      linear_layout(:orientation => :vertical) do

        @et = edit_text
        @quantity = edit_text :hint => "Cantidad de jugadores"
        @persons = edit_text :hint=> "Escriba los nombres de los jugadores ej:Pato Colo Ivan Alvaro"

        linear_layout do
          button :text => "Formar Equipos", :on_click_listener => proc { generate_team }
        end

        @tv = text_view :text => "Click buttons or menu items:"
      end
    )

  end

  private 

  def generate_team

  end

end
require 'ruboto/widget'
require 'ruboto/util/toast'
require_relative "person"
require_relative "tournament"

ruboto_import_widgets :EditText, :TextView, :Button, :LinearLayout

# http://xkcd.com/378/

class Fixture10Activity
  def onCreate(bundle)
    super

    handle_click = proc do |view|
      @tv.append "holaa"
      @et.append = "@quantity.text"
    end

    setContentView(
      linear_layout(:orientation => :vertical) do

        @et = edit_text
        @quantity = edit_text :hint => "Cantidad de jugadores"
        @persons = edit_text :hint=> "----"

        linear_layout do
          button :text => "Formar Equipos", :on_click_listener => handle_click
        end

        @tv = text_view :text => "Click buttons or menu items:"
      end
    )

  end

  private 

  def generate_team
    torneo = Tournament.new()
    torneo.set_persons_names(@persons.text)
    torneo.mix
    @et.text = torneo.fixture
  end

end
