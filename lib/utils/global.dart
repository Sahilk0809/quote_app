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
  'Dancing Script',
  'Josefin Sans',
  'Anton',
  'Exo 2',
  'Pacifico',
  'Lobster',
  'Imbue',
  'Crimson Text',
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
  'assets/img/love.jpg',
  'assets/img/broken.jpg',
  'assets/img/sad.jpg',
  'assets/img/love2.jpg',
  // Add more image URLs as needed
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

GlobalKey repaintKey = GlobalKey();

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