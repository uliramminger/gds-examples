# db/seeds.rb

data = GDstruct.c( <<-EOS )

currencies , @schema( name, symbol, iso4217code, iso4217number, subunit )                                      /*
  ------------------------------------------------------------------------------------------------------------
                           name                          symbol     iso4217code   iso4217number  subunit
  ------------------------------------------------------------------------------------------------------------ */
  &australian_dollar     : Australian dollar           | '$'      | AUD         |  36          | cent
  &brazilian_real        : Brazilian real              | 'R$'     | BRL         | 986          | centavo
  &euro                  : Euro                        | '€'      | EUR         | 978          | cent
  &united_states_dollar  : United States dollar        | '$'      | USD         | 840          | cent

countries , @schema( name, capital, area, population, currency )                                              /*
  -----------------------------------------------------------------------------------------------------------
    name                        capital            area (km^2)   population      currency
  ----------------------------------------------------------------------------------------------------------- */
  : Australia                 | Canberra         |  7_692_024  |    25_130_600 | *australian_dollar
  : Austria                   | Vienna           |     83_878  |     8_822_267 | *euro
  : Brazil                    | Brasília         |  8_515_767  |   210_147_125 | *brazilian_real
  : British Virgin Islands    | Road Town        |        153  |        31_758 | *united_states_dollar
  : Christmas Island          | Flying Fish Cove |        135  |         1_843 | *australian_dollar
  : Deutschland               | Berlin           |    357_385  |    82_521_653 | *euro
  : France                    | Paris            |    643_801  |    66_991_000 | *euro
  : Guam                      | Hagåtña          |        540  |       162_742 | *united_states_dollar
  : Kiribati                  | Tarawa           |        811  |       110_136 | *australian_dollar
  : Marshall Islands          | Majuro           |        181  |        53_066 | *united_states_dollar
  : Nauru                     | Yaren            |         21  |        11_200 | *australian_dollar
  : Palau                     | Melekeok         |        459  |        21_503 | *united_states_dollar
  : Puerto Rico               | San Juan         |      9_104  |     3_337_177 | *united_states_dollar
  : USA                       | Washington, D.C. |  9_833_520  |   325_719_178 | *united_states_dollar

EOS

data[:currencies].each do |currencydef|
  currency = Currency.create!( currencydef )
  currencydef[:id] = currency.id
end

data[:countries].each do |countrydef|
  Country.create!( countrydef.merge( currency_id: countrydef[:currency][:id] ).except(:currency) )
end
