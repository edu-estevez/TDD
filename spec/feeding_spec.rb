RSpec.describe Alimento do
       before (:all)	do
                @carne_vaca = Alimento.new("Carne de vaca", 21.1,0.0,3.1,50.0,164.0)
		@carne_cordero = Alimento.new("Carne de cordero", 18.0,0.0,17.0,20.0,185.0)
		@camarones = Alimento.new("Camarones", 17.6,1.5,0.6,18.0,2.0)
		@salmon = Alimento.new("Salmón",19.9,0.0,13.6,6.0,3.7)
		@lentejas = Alimento.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
        end

       it "Obtener el nombre" do
	       expect(@carne_vaca.name).to eq("Carne de vaca")
	       expect(@carne_cordero.name).to eq("Carne de cordero")
	       expect(@camarones.name).to eq("Camarones")
	       expect(@salmon.name).to eq("Salmón")
	       expect(@lentejas.name).to eq("Lentejas")
       end

       it "Obtener gramos de proteína" do
	       expect(@carne_vaca.proteina).to eq(21.1)
	       expect(@carne_cordero.proteina).to eq(18.0)
	       expect(@camarones.proteina).to eq(17.6)
	       expect(@salmon.proteina).to eq(19.9)
	       expect(@lentejas.proteina).to eq(23.5)
       end

       it "Obtener gramos de carbohidratos" do
	       expect(@carne_vaca.carbohidratos).to eq(0.0)
               expect(@carne_cordero.carbohidratos).to eq(0.0)
               expect(@camarones.carbohidratos).to eq(1.5)
	       expect(@salmon.carbohidratos).to eq(0.0)
	       expect(@lentejas.carbohidratos).to eq(52.0)
       end

       it "Obtener gramos de lípidos" do
	       expect(@carne_vaca.lipidos).to eq(3.1)
               expect(@carne_cordero.lipidos).to eq(17.0)
	       expect(@camarones.lipidos).to eq(0.6)
	       expect(@salmon.lipidos).to eq(13.6)
	       expect(@lentejas.lipidos).to eq(1.4)
       end

       it "Obtener kilos de gases de efecto invernadero" do
	       expect(@carne_vaca.gases).to eq(50.0)
	       expect(@carne_cordero.gases).to eq(20.0)
	       expect(@camarones.gases).to eq(18.0)
	       expect(@salmon.gases).to eq(6.0)
               expect(@lentejas.gases).to eq(0.4)
       end

       it "Obtener uso del terreno anual en m²" do
	       expect(@carne_vaca.terreno).to eq(164.0)
               expect(@carne_cordero.terreno).to eq(185.0)
               expect(@camarones.terreno).to eq(2.0)
	       expect(@salmon.terreno).to eq(3.7)
	       expect(@lentejas.terreno).to eq(3.4)
       end

       it "Obtener el alimento formateado" do
               expect(@carne_vaca.formato).to eq("Nombre: #{@carne_vaca.name} Proteínas: #{@carne_vaca.proteina} Carbohidratos: #{@carne_vaca.carbohidratos} Lípidos: #{@carne_vaca.lipidos} GasesEI: #{@carne_vaca.gases} Terreno: #{@carne_vaca.terreno}")

               expect(@carne_cordero.formato).to eq("Nombre: #{@carne_cordero.name} Proteínas: #{@carne_cordero.proteina} Carbohidratos: #{@carne_cordero.carbohidratos} Lípidos: #{@carne_cordero.lipidos} GasesEI: #{@carne_cordero.gases} Terreno: #{@carne_cordero.terreno}")

               expect(@camarones.formato).to eq("Nombre: #{@camarones.name} Proteínas: #{@camarones.proteina} Carbohidratos: #{@camarones.carbohidratos} Lípidos: #{@camarones.lipidos} GasesEI: #{@camarones.gases} Terreno: #{@camarones.terreno}")
	       
               expect(@salmon.formato).to eq("Nombre: #{@salmon.name} Proteínas: #{@salmon.proteina} Carbohidratos: #{@salmon.carbohidratos} Lípidos: #{@salmon.lipidos} GasesEI: #{@salmon.gases} Terreno: #{@salmon.terreno}")

               expect(@lentejas.formato).to eq("Nombre: #{@lentejas.name} Proteínas: #{@lentejas.proteina} Carbohidratos: #{@lentejas.carbohidratos} Lípidos: #{@lentejas.lipidos} GasesEI: #{@lentejas.gases} Terreno: #{@lentejas.terreno}")
       end

       it "Obtener las kcal del alimento" do
	       expect(@carne_vaca.kcal).to eq(112.3)
               expect(@carne_cordero.kcal).to eq(225)
	       expect(@camarones.kcal).to eq(81.8)
               expect(@salmon.kcal).to eq(202)
	       expect(@lentejas.kcal).to eq(314.6)
       end

       context "Calcular el impacto ambiental de la dieta recomendada para un varón adulto (54gr proteína)" do
	       it "Obtener impacto ambiental de la dieta" do
		       @carne_de_vaca = Alimento.new("Carne de vaca",10.0,0.0,1.47,50.0,164.0) #47.4 gr
		       @carne_de_cordero = Alimento.new("Carne de cordero",10.0,0.0,9.44,20.0,185.0) #55.6 gr
		       @lentejas_ = Alimento.new("Lentejas",10.0,22.13,0.6,0.4,3.4) #42.6 gr
		       @tofu = Alimento.new("Tofu",10.0,2.38,6.0,2.0,2.2) #125 gr
		       @nuez = Alimento.new("Nuez",14.0,14.7,37.8,0.3,7.9) #70 gr

		       expect(@carne_de_vaca.impacto(47.4,@carne_de_cordero,55.6, @lentejas,42.6, @tofu,125, @nuez,70).to_s).to eq("[3.77, 19.03]")

	       end
       end

       context "Calcular el impacto ambiental de la dieta recomendada para una mujer adulta (47 gr proteína)" do
	       it "Obtener el impacto ambiental de la nueva dieta" do
		       @carne_de_vaca = Alimento.new("Carne de vaca",10.0,0.0,1.47,50.0,164.0) #47.4 gr
                       @carne_de_cordero = Alimento.new("Carne de cordero",10.0,0.0,9.44,20.0,185.0) #55.6 gr
                       @lentejas_ = Alimento.new("Lentejas",10.0,22.13,0.6,0.4,3.4) #42.6 gr
                       @tofu = Alimento.new("Tofu",10.0,2.38,6.0,2.0,2.2) #125 gr
		       @nuez = Alimento.new("Nuez",7.0,7.35,18.9,0.3,7.9) #35 gr

		       expect(@carne_de_vaca.impacto(47.4,@carne_de_cordero,55.6, @lentejas,42.6, @tofu,125, @nuez,35).to_s).to eq("[3.76, 18.76]")

	       end
       end
end

RSpec.describe Lista do
end
