Map<int, Movie> movieData = {
  0: Movie(
    id: 0,
    name: 'Avatar 2: The Way Of Water',
    image: getImageLocation(0),
    description:
        '''Avatar: The Way of Water is a 2022 American epic science fiction film directed by James Cameron from a screenplay he co-wrote with Rick Jaffa and Amanda Silver, with a story the trio wrote with Josh Friedman and Shane Salerno. Distributed by 20th Century Studios, it is the sequel to Avatar (2009) and the second film in the Avatar franchise. Cast members Sam Worthington, Zoe Saldaña, Stephen Lang, Joel David Moore, CCH Pounder, Giovanni Ribisi, Dileep Rao, and Matt Gerald reprise their roles from the original film, with Sigourney Weaver returning in a different role.[5] New cast members include Kate Winslet, Cliff Curtis, Edie Falco and Jemaine Clement. In the film, Jake Sully (Worthington) and his family explore the oceans of Pandora to meet the Metkayina clan.''',
    genre: ['Sci-fi', 'Fantasy', 'Adventure'],
    rating: 7.7,
    releaseDate: '2022',
    duration: '3h 12m',
    cast: [
      'Sam Worthington',
      'Zoe Saldana',
      'Michelle Rodriguez',
      'Stephen Lang',
      'Sigourney Weaver',
      'Oona Chaplin'
    ],
    current: true,
  ),
  1: Movie(
    id: 1,
    name: 'Black Panther 2: Wakanda Forever',
    image: getImageLocation(1),
    description:
        '''Black Panther: Wakanda Forever is a 2022 American superhero film based on the Marvel Comics character Black Panther. Produced by Marvel Studios and distributed by Walt Disney Studios Motion Pictures, it is the sequel to Black Panther (2018) and the 30th film in the Marvel Cinematic Universe (MCU). Directed by Ryan Coogler, who co-wrote the screenplay with Joe Robert Cole, the film stars Letitia Wright as Shuri / Black Panther, alongside Lupita Nyong'o, Danai Gurira, Winston Duke, Florence Kasumba, Dominique Thorne, Michaela Coel, Tenoch Huerta Mejía, Martin Freeman, Julia Louis-Dreyfus, and Angela Bassett. In the film, the leaders of Wakanda fight to protect their nation in the wake of King T'Challa's death.''',
    genre: ['Action', 'Thriller', 'Superhero'],
    rating: 7.2,
    releaseDate: '2022',
    duration: '2h 41m',
    cast: [
      'Chadwick Boseman',
      'Michael B. Jordan',
      'Lupita Nyong\'o',
      'Danai Gurira',
      'Letitia Wright',
      'Winston Duke',
      'Angela Bassett',
      'Forest Whitaker',
      'Martin Freeman',
      'Daniel Kaluuya',
      'Florence Kasumba',
      'Sterling K. Brown'
    ],
    current: true,
  ),
  2: Movie(
    id: 2,
    name: 'The Batman',
    image: getImageLocation(2),
    description:
        '''The Batman is a 2022 American superhero film based on the DC Comics character Batman. Produced by DC Films, 6th & Idaho, and Dylan Clark Productions, and distributed by Warner Bros. Pictures, it is a reboot of the Batman film franchise. The film was directed by Matt Reeves, who wrote the screenplay with Peter Craig. It stars Robert Pattinson as Bruce Wayne / Batman alongside Zoë Kravitz, Paul Dano, Jeffrey Wright, John Turturro, Peter Sarsgaard, Andy Serkis, and Colin Farrell. The film sees Batman, who has been fighting crime in Gotham City for two years, uncover corruption while pursuing the Riddler (Dano), a serial killer who targets Gotham's elite.''',
    genre: ['Action', 'Mystery', 'Superhero'],
    rating: 7.8,
    releaseDate: '2022',
    duration: '2h 56m',
    cast: [
      'Robert Pattinson',
      'Zoë Kravitz',
      'Paul Dano',
      'Jeffrey Wright',
      'John Turturro',
      'Peter Sarsgaard',
      'Jayme Lawson',
      'Andy Serkis'
    ],
  ),
  3: Movie(
    id: 3,
    name: 'Enola Holmes 2',
    image: getImageLocation(3),
    description:
        '''Enola Holmes 2 is a 2022 mystery film and the sequel to the 2020 film Enola Holmes, both of which star Millie Bobby Brown as the title character, the teenage sister of the already-famous Victorian-era detective Sherlock Holmes. The film is directed by Harry Bradbeer from a screenplay by Jack Thorne that adapts the book series The Enola Holmes Mysteries by Nancy Springer. Unlike its predecessor, the film does not adapt one of Springer's novels, and instead takes real-life inspiration from the 1888 matchgirls' strike.[2] In addition to Brown, Henry Cavill, Louis Partridge, Susie Wokoma, Adeel Akhtar, and Helena Bonham Carter reprise their supporting roles, while David Thewlis and Sharon Duncan-Brewster join the cast.''',
    genre: ['Mystery', 'Crime', 'Action'],
    rating: 6.8,
    releaseDate: '2022',
    duration: '2h 09m',
    cast: [
      'Millie Bobby Brown',
      'Henry Cavill',
      'Sam Claflin',
      'Helena Bonham Carter',
      'Louis Partridge',
      'Fiona Shaw',
      'Frances de la Tour',
      'Adeel Akhtar'
    ],
  ),
  4: Movie(
    id: 4,
    name: 'Top Gun: Maverick',
    image: getImageLocation(4),
    description:
        '''Top Gun: Maverick is a 2022 American action drama film directed by Joseph Kosinski and written by Ehren Kruger, Eric Warren Singer, and Christopher McQuarrie from a story by Peter Craig and Justin Marks. The film is a sequel to the 1986 film Top Gun. Tom Cruise reprises his starring role as the naval aviator Maverick. It was based on the characters of the original film created by Jim Cash and Jack Epps Jr.. The film also stars Val Kilmer, Miles Teller, Jennifer Connelly, Jon Hamm, Glen Powell, Lewis Pullman, and Ed Harris. In the film, Maverick confronts his past while training a group of younger Top Gun graduates, including the son of his deceased best friend, for a dangerous mission.''',
    genre: ['Action', 'Adventure', 'Drama'],
    rating: 8.4,
    releaseDate: '2022',
    duration: '2h 10m',
    cast: [
      'Tom Cruise',
      'Miles Teller',
      'Jennifer Connelly',
      'Jon Hamm',
      'Glen Powell',
      'Lewis Pullman',
      'Val Kilmer'
    ],
  ),
  5: Movie(
    id: 5,
    name: 'Doctor Strange in the Multiverse of Madness',
    image: getImageLocation(5),
    description:
        '''Doctor Strange in the Multiverse of Madness is a 2022 American superhero film based on Marvel Comics featuring the character Doctor Strange. Produced by Marvel Studios and distributed by Walt Disney Studios Motion Pictures, it is the sequel to Doctor Strange (2016) and the 28th film in the Marvel Cinematic Universe (MCU). The film was directed by Sam Raimi, written by Michael Waldron, and stars Benedict Cumberbatch as Stephen Strange, alongside Elizabeth Olsen, Chiwetel Ejiofor, Benedict Wong, Xochitl Gomez, Michael Stuhlbarg, and Rachel McAdams. In the film, Strange protects America Chavez (Gomez), a teenager capable of traveling the multiverse, from Wanda Maximoff (Olsen).''',
    genre: ['Superhero', 'Action', 'Horror'],
    rating: 6.9,
    releaseDate: '2022',
    duration: '2h 06m',
    cast: [
      'Benedict Cumberbatch',
      'Elizabeth Olsen',
      'Chiwetel Ejiofor',
      'Rachel McAdams',
      'Benedict Wong',
    ],
  ),
  6: Movie(
    id: 6,
    name: 'Black Adam',
    image: getImageLocation(6),
    description:
        '''Black Adam is an upcoming American superhero film based on the DC Comics character of the same name. Produced by DC Films and distributed by Warner Bros. Pictures, it is intended to be the seventh installment in the DC Extended Universe (DCEU). The film is directed by Jaume Collet-Serra from a screenplay by Adam Sztykiel, and stars Dwayne Johnson as the titular character, with Aldis Hodge, Noah Centineo, Pierce Brosnan, and Quintessa Swindell in supporting roles. It is scheduled to be released in the United States on December 22, 2021, by Warner Bros. Pictures.''',
    genre: ['Action', 'Thriller', 'Sci-Fi'],
    rating: 6.6,
    releaseDate: '2022',
    duration: '2h 05m',
    cast: [
      'Dwayne Johnson',
      'Aldis Hodge',
      'Noah Centineo',
      'Pierce Brosnan',
      'Quintessa Swindell'
    ],
    current: true,
  ),
};

String getImageLocation(int index) => 'assets/images/posters/$index.jpg';

class Movie {
  final int id;
  final String name;
  final String image;
  final String description;
  final List<String> genre;
  final double rating;
  final String releaseDate;
  final String duration;
  final List<String> cast;
  final bool current;
  Movie({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.genre,
    required this.rating,
    required this.releaseDate,
    required this.duration,
    required this.cast,
    this.current = false,
  });
}

class MovieConversion {
// convert movie to json
  Movie sampleMovie = Movie(
    id: 1,
    name: 'Avengers: Endgame',
    image: getImageLocation(1),
    description:
        'After the devastating events of Avengers: Infinity War (2018), the universe is in ruins due to the efforts of the Mad Titan, Thanos. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos\' actions and restore balance to the universe.',
    genre: ['Action', 'Adventure', 'Drama'],
    rating: 8.4,
    releaseDate: '26 April 2019',
    duration: '3h 1m',
    cast: [
      'Robert Downey Jr.',
      'Chris Evans',
      'Mark Ruffalo',
      'Chris Hemsworth',
      'Scarlett Johansson',
      'Jeremy Renner',
      'Don Cheadle',
      'Paul Rudd',
      'Brie Larson',
      'Karen Gillan',
      'Danai Gurira',
      'Benedict Wong',
      'Jon Favreau',
      'Bradley Cooper',
      'Gwyneth Paltrow',
    ],
    current: true,
  );
  Map<String, dynamic> movieToJson(Movie movie) => {
        'id': movie.id,
        'name': movie.name,
        'image': movie.image,
        'description': movie.description,
        'genre': movie.genre,
        'rating': movie.rating,
        'releaseDate': movie.releaseDate,
        'duration': movie.duration,
        'cast': movie.cast,
        'current': movie.current,
      };

// convert json to movie
  Movie movieFromJson(Map<String, dynamic> json) {
    List<String> genre = [];
    List<String> cast = [];
    json['genre'].forEach((str) => genre.add(str as String));
    json['cast'].forEach((str) => cast.add(str as String));
    return Movie(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      genre: genre,
      rating: json['rating'],
      releaseDate: json['releaseDate'],
      duration: json['duration'],
      cast: cast,
      current: json['current'],
    );
  }
}
