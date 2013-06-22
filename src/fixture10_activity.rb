require 'ruboto/widget'
require 'ruboto/util/toast'
require_relative "person"
require_relative "tournament"

ruboto_import_widgets :EditText, :TextView, :Button, :LinearLayout

class Fixture10Activity
  def onCreate(bundle)
    setTitle 'Fixture'
    super

    setContentView(
      linear_layout(:orientation => :vertical) do
        @quantity = edit_text :hint => "Cantidad de jugadores por equipo."
        @team = edit_text :hint=> "Escriba los nombres de los jugadores."
        linear_layout do
          button :text => "Formar Equipos", :on_click_listener => proc{generate_team}
        end
        @tv = text_view :text => "Equipos:"
      end
    )
  end

  private 

  def generate_team
    torneo = Tournament.new()
    torneo.set_persons_names(@team.text.to_s)
    torneo.mix
    @tv.text = ""
    torneo.fixture(@quantity.text.to_s.to_i).each{|team, value |
      @tv.append  "\nEquipo#{value}: "
      team.each{|person|
        @tv.append  " #{person.name} "
        }
      }
  end

end
