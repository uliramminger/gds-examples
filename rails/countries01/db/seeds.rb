# db/seeds.rb

countries = GDstruct.c( <<-EOS )
$country(name,capital,area,population,vehicleRegistrationCode,iso3166code,callingCode)
, $country   /*
    name            capital            area (km^2)   population      vehicleRegistrationCode   iso3166code   callingCode
  ---------------------------------------------------------------------------------------------------------------------------- */
  : Australia     | Canberra         |  7_692_024  |    25_130_600 | AUS                     | AU          | 61
  : Austria       | Vienna           |     83_878  |     8_822_267 | A                       | AT          | 43
  : Belgium       | Brussels         |     30_528  |    11_420_163 | B                       | BE          | 32
  : Brazil        | Brazília         |  8_515_767  |   210_147_125 | BR                      | BR          | 55
  : Canada        | Ottawa           |  9_984_670  |    36_503_097 | CDN                     | CA          | 1
  : China         | Beijing          |  9_596_961  | 1_403_500_365 | CHN                     | CN          | 86
  : Costa Rica    | San José         |     51_100  |     4_857_274 | CR                      | CR          | 506
  : Denmark       | Copenhagen       |     42_921  |     5_748_769 | DK                      | DK          | 45
  : Deutschland   | Berlin           |    357_385  |    82_521_653 | D                       | DE          | 49
  : Estonia       | Tallinn          |     45_227  |     1_319_133 | EST                     | EE          | 372
  : France        | Paris            |    643_801  |    66_991_000 | F                       | FR          | 33
  : India         | New Dehli        |  3_287_469  | 1_339_180_000 | IND                     | IN          | 91
  : Mauritius     | Port Louis       |      2_040  |     1_262_132 | MS                      | MU          | 230
  : Niger         | Niamey           |  1_267_000  |    20_672_987 | RN                      | NE          | 227
  : Nigeria       | Abuja            |    923_768  |   190_886_311 | WAN                     | NG          | 234
  : Russia        | Moscow           | 17_075_400  |   144_526_636 | RUS                     | RU          | 7
  : USA           | Washington, D.C. |  9_833_520  |   325_719_178 | USA                     | US          | 1
EOS

countries.each do |c|
  country = Country.create!( c )
end

