# db/seeds.rb

countries = GDstruct.c( <<-EOS )
@schema country( name, capital, area, population, vehicleRegistrationCode, iso3166code, callingCode )
@schema city( name, population )
, @schema country                                                                                                                                                       /*
  --------------------------------------------------------------------------------------------------------------------------------------------------------------
    name            capital            area (km^2)   population      vehicleRegistrationCode   iso3166code   callingCode ||  name                 population
  -------------------------------------------------------------------------------------------------------------------------------------------------------------- */
  : Australia     | Canberra         |  7_692_024  |    25_130_600 | AUS                     | AU          | 61
    bigCities , @schema city
      :                                                                                                                      Sydney            |  5_131_326
      :                                                                                                                      Melbourne         |  4_850_740
      :                                                                                                                      Brisbane          |  2_408_223
  : Austria       | Vienna           |     83_878  |     8_822_267 | A                       | AT          | 43
    bigCities , @schema city
      :                                                                                                                      Vienna            |  1_840_573
      :                                                                                                                      Graz              |    272_838
      :                                                                                                                      Linz              |    198_181
      :                                                                                                                      Salzburg          |    148_420
      :                                                                                                                      Innsbruck         |    126_851
  : Brazil        | Brazília         |  8_515_767  |   210_147_125 | BR                      | BR          | 55
  : Canada        | Ottawa           |  9_984_670  |    36_503_097 | CDN                     | CA          | 1
    bigCities , @schema city
      :                                                                                                                      Toronto           |  2_731_571
  : China         | Beijing          |  9_596_961  | 1_403_500_365 | CHN                     | CN          | 86
    bigCities , @schema city
      :                                                                                                                      Chongqing         | 30_165_500
      :                                                                                                                      Shanghai          | 24_183_300
      :                                                                                                                      Beijing           | 21_707_000
      :                                                                                                                      Guangzhou         | 13_081_000
      :                                                                                                                      Tianjin           | 11_249_000
  : France        | Paris            |    643_801  |    66_991_000 | F                       | FR          | 33
    bigCities , @schema city
      :                                                                                                                      Paris             |  2_229_621
      :                                                                                                                      Marseille         |    855_393
  : Mauritius     | Port Louis       |      2_040  |     1_262_132 | MS                      | MU          | 230
  : Niger         | Niamey           |  1_267_000  |    20_672_987 | RN                      | NE          | 227
  : Russia        | Moscow           | 17_075_400  |   144_526_636 | RUS                     | RU          | 7
    bigCities , @schema city
      :                                                                                                                      Moscow            | 12_380_664
      :                                                                                                                      Saint Petersburg  |  5_281_579
      :                                                                                                                      Novosibirsk       |  1_602_915
      :                                                                                                                      Yekaterinburg     |  1_455_514
  : USA           | Washington, D.C. |  9_833_520  |   325_719_178 | USA                     | US          | 1
EOS

countries.each do |countrydef|
  country = Country.create!( countrydef.except(:bigCities) )
  country.bigCities.create!( countrydef[:bigCities] )  if countrydef[:bigCities]
end
