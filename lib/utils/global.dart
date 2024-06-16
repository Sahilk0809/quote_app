import 'package:flutter/material.dart';

List category = [
  'Success',
  'Love',
  'Inspiration',
  'Sports',
  'Motivation',
  'Positive',
  'Mental Health',
  'Discipline',
  'Broken',
  'Friendship',
];

List fontFamilyList = [
  'Crimson Text',
  'Dancing Script',
  'Josefin Sans',
  'Anton',
  'Exo 2',
  'Pacifico',
  'Lobster',
  'Imbue',
  'Prompt',
  'Varela Round',
  'Licorice',
  'Play',
  'IBM Plex Mono',
  'Caveat',
  'Chakra Petch',
  'Shadows Into Light',
  'Abril Fatface',
  'Satisfy',
  'Lilita One',
  'Galada',
  'Permanent Marker',
  'Indie Flower',
  'Edu NSW ACT Foundation',
  'Orbitron',
  'Cinzel',
];

List<String> imageList = [
  'assets/img/sad2.jpg',
  'assets/img/animal3.webp',
  'assets/img/love4.jpg',
  'assets/img/love3.jpg',
  'assets/img/nature.jpg',
  'assets/img/krishna.jpg',
  'assets/img/nature2.jpg',
  'assets/img/krishna2.jpg',
  'assets/img/nature3.jpeg',
  'assets/img/nature4.jpg',
  'assets/img/sad.jpg',
  'assets/img/nature5.jpg',
  'assets/img/nature6.webp',
  'assets/img/nature7.jpg',
  'assets/img/animal1.jpg',
  'assets/img/animal2.jpg',
  'assets/img/love2.jpg',
  'assets/img/love.jpg',
  'assets/img/love5.jpeg',
  'assets/img/broken.jpg',
];

List<Color> colorPick = [
  Colors.white,
  Colors.black,
  Colors.orange,
  Colors.red,
  Colors.yellow,
  Colors.blue,
  Colors.teal,
  Colors.indigo,
];

int globalIndex = 0;

List likeList = [];

bool isLike = false;

bool isGrid = true;

GlobalKey repaintNewKey = GlobalKey();

GlobalKey repaintKey = GlobalKey();
List<GlobalKey> globalKey = [];

int colorSelect = 0;

int imageSelect = 0;

int fontIndex = 0;

bool addProcess = false;

List colorList = [
  {
    'color1': Colors.blue,
    'color2': Colors.cyan[400],
  },
  {
    'color1': Colors.orange,
    'color2': Colors.deepOrange[400],
  },
  {
    'color1': Colors.deepPurpleAccent,
    'color2': Colors.deepPurple[400],
  },
  {
    'color1': Colors.pinkAccent,
    'color2': Colors.pink[400],
  },
  {
    'color1': Colors.green,
    'color2': Colors.lightGreen[400],
  },
  {
    'color1': Colors.teal,
    'color2': Colors.tealAccent[400],
  },
  {
    'color1': Colors.red,
    'color2': Colors.redAccent[400],
  },
  {
    'color1': Colors.indigo,
    'color2': Colors.indigoAccent[400],
  },
  {
    'color1': Colors.amber,
    'color2': Colors.amberAccent[400],
  },
  {
    'color1': Colors.deepPurple,
    'color2': Colors.deepPurpleAccent[400],
  },
];

int selectedIndex = 0;