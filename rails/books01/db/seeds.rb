# db/seeds.rb

data = GDstruct.c( <<-EOS )

authors , @schema( firstname, lastname )                     /*
  ----------------------------------------------------------
                  first name     last name
  ---------------------------------------------------------- */
  &h_abelson    : Harold       | Abelson
  &e_gamma      : Erich        | Gamma
  &j_goerzen    : John         | Goerzen
  &r_helm       : Richard      | Helm
  &r_johnson    : Ralph        | Johnson
  &dr_musser    : David R.     | Musser
  &b_o_sullivan : Bryan        | O'Sullivan
  &r_olsen      : Russ         | Olsen
  &a_saini      : Atul         | Saini
  &d_stewart    : Don          | Stewart
  &gj_sussman   : Gerald Jay   | Sussman
  &j_sussman    : Julie        | Sussman
  &j_vlissides  : John         | Vlissides

books , @schema book( title, subtitle, year, isbn )                                                                                           /*
  -------------------------------------------------------------------------------------------------------------------------------------------
    title                                                subtitle                                                  year   ISBN number
  ------------------------------------------------------------------------------------------------------------------------------------------- */
  : Design Patterns                                    | Elements of Reusable Object-Oriented Software           | 1995 | '0-201-63361-2'
    authors, *e_gamma | *r_helm | *r_johnson | *j_vlissides
  : Design Patterns in Ruby                            | @na                                                     | 2008 | '0-321-49045-2'
    authors, *r_olsen
  : Real World Haskell                                 | @na                                                     | 2009 | '0-596-51498-3'
    authors, *b_o_sullivan | *j_goerzen | *d_stewart
  : STL Tutorial and Reference Guide                   | C++ Programming with the Standard Template Library      | 1996 | '0-201-63398-1'
    authors, *dr_musser | *a_saini
  : Structure and Interpretation of Computer Programs  | Second Edition                                          | 1996 | '0-262-51087-1'
    authors, *h_abelson | *gj_sussman | *j_sussman

EOS

data[:authors].each do |authordef|
  author = Author.create!( authordef )
  authordef[:id] = author.id
end

data[:books].each do |bookdef|
  book = Book.create!( bookdef.except(:authors) )

  bookdef[:authors].each do |authordef|
    book.publications.create!( book_id: book.id, author_id: authordef[:id] )
  end
end
