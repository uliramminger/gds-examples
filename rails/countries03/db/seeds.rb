# db/seeds.rb

countries = GDstruct.c( <<-EOS )
@schema country( name, capital, area, population, vehicleRegistrationCode, iso3166code, callingCode )
@schema city( name, population )
@schema museum( name, established )
@schema person( firstname, lastname, yearOfBirth )
, @schema country                                                                                                                                                                                                                                                                /*
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Country                                                                                                              ||  City                              ||  Museum                                      ||  Person
    name            capital            area (km^2)   population      vehicleRegistrationCode   iso3166code   callingCode ||  name                 population   ||  name                   | established (year) ||  firstname         | lastname         | year of birth
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- */
  : Austria       | Vienna           |     83_878  |     8_822_267 | A                       | AT          | 43
    bigCities , @schema city
      :                                                                                                                      Vienna            |  1_840_573
      :                                                                                                                      Graz              |    272_838
      :                                                                                                                      Linz              |    198_181
    famousPeople, @schema person
      :                                                                                                                                                                                                            Wolfgang Amadeus  | Mozart           | 1756
      :                                                                                                                                                                                                            Kurt              | Gödel            | 1906
  : Deutschland   | Berlin           |    357_385  |    82_521_653 | D                       | DE          | 49
    bigCities , @schema city
      :                                                                                                                      Berlin            |  3_613_495
        museums, @schema museum
          :                                                                                                                                                        Pergamon Museum        | 1910
          :                                                                                                                                                        Bode Museum            | 1904
          :                                                                                                                                                        Bauhaus Archive        | 1960
          :                                                                                                                                                        Natural History Museum | 1889
      :                                                                                                                      Munich            |  1_456_039
        museums, @schema museum
          :                                                                                                                                                        Deutsches Museum       | 1903
    famousPeople, @schema person
      :                                                                                                                                                                                                            Albert            | Einstein         | 1879
      :                                                                                                                                                                                                            Friedrich         | Schiller         | 1759
      :                                                                                                                                                                                                            Johann Sebastian  | Bach             | 1685
  : France        | Paris            |    643_801  |    66_991_000 | F                       | FR          | 33
    bigCities , @schema city
      :                                                                                                                      Paris             |  2_229_621
      :                                                                                                                      Marseille         |    855_393
  : USA           | Washington, D.C. |  9_833_520  |   325_719_178 | USA                     | US          | 1
EOS

countries.each do |countrydef|
  country = Country.create!( countrydef.except(:bigCities,:famousPeople) )

  countrydef[:bigCities].each do |citydef|
    city = City.new( citydef.except(:museums) )
    country.bigCities << city
    city.museums.create!( citydef[:museums] )  if citydef[:museums]
  end  if countrydef[:bigCities]

  country.famousPeople.create!( countrydef[:famousPeople] )  if countrydef[:famousPeople]
end
