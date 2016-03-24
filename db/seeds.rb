STDOUT.sync = true

DJLIST = <<EOF
DAVID GUETTA
HARDWELL
TIESTO
MARTIN GARRIX
AVICII
AFROJACK
DIMITRI VEGAS & LIKE MIKE
SKRILLEX
ARMIN VAN BUUREN
CALVIN HARRIS
STEVE AOKI
NICKY ROMERO
DEADMAU5
R3HAB
SWEDISH HOUSE MAFIA
ZEDD
W&W
DVBBS
DAFT PUNK
ALESSO
SNAKE
AXWELL
NERVO
BLASTERJAXX
SHOWTEK
FEDDE LE GRAND
DIPLO
PAUL VAN DYK
BORGEOUS
JUICY M
DASH BERLIN
SANDER VAN DOORN
ABOVE & BEYOND
BASSJACKERS
TOMMY TRASH
CARL COX
LAIDBACK LUKE
BINGO PLAYERS
UMMET OZCAN
DADA LIFE
DANNIC
STEVE ANGELLO
KNIFE PARTY
MAJOR LAZER
OLIVER HELDENS
KREWELLA
VINAI
DYRO
DON DIABLO
DILLON FRANCIS
KSHMR
BL3ND
FIREBEATZ
DEORRO
ERIC PRYDZ
QUINTINO
MAKJ
RICHIE HAWTIN
KASKADE
ADAM BEYER
SVEN VATH
KYGO
THE CHAINSMOKERS
MARKUS SCHULZ
SICK INDIVIDUALS
3LAU
ALY & FILA
BORGORE
CARNAGE
NINA KRAVIZ
CHUCKIE
PAUL OAKENFOLD
FERRY CORSTEN
THOMAS GOLD
MARCO CAROLA
BENNY BENASSI
JAY HARDWAY
DUBFIRE
MOTI
TJR
LOCO DICE
ADVENTURE CLUB
DZEKO & TORRES
GARETH EMERY
DIRTY SOUTH
NYK
FTAMPA
HEADHUNTERZ
VICETONE
KILL THE NOISE
JOHN DIGWEED
UMEK
MOGUAI
ANDREW RAYEL
REDFOO
JAUZ
JAMIE JONES
SHADOW
ZOMBOY
MACEO PLEX
EOF

DJLIST.each_line do |dj|
  name = dj.strip
  unless Dj.find_by_name(name)
    Dj.create([:name => name])
    print '.'
  end
end
puts "Done!"