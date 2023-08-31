
import 'DataBaseLogic.dart';
List foodx = [
  {
    'category': 'food',
    'name': 'italiano pasta ziti - 400 gram',
    'calories': '360 kcal/100gm',
    'price': '14.95',
    'count': 360,
    'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'lamar full cream milk - 1 liter',
  'calories': '120 kcal/100ml',
  'price': '34.75',
  'count': 120,
  'gmORml': 'ml'
  },
  {
    'category': 'food',
    'name': 'juhayna full cream milk - 1.5 liter',
    'calories': '114 kcal/100ml',
    'price': '49.50',
    'count': 114,
    'gmORml': 'ml'
  },
  {
  'category': 'food',
  'name': 'al doha egyptian rice - 1kg',
  'calories': '350 kcal/100gm',
  'price': '30.95',
  'count': 350,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'domty feta cheese, low salt - 1 kg',
  'calories': '240 kcal/100gm',
  'price': '83.10',
  'count': 240,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'dolphin tuna shredded - 200 gram',
  'calories': '200 kcal/100gm',
  'price': '24.98',
  'count': 200,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'almarai beef burger - 1kg',
  'calories': '140 kcal/100gm',
  'price': '89.95',
  'count': 140,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'koki beef hot dog - 30 pieces',
  'calories': '166 kcal/100gm',
  'price': '113.95',
  'count': 166,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'americana beef burger - 30 pieces',
  'calories': '140 kcal/100gm',
  'price': '86.95',
  'count': 140,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'balady beef neck - 1 kg',
  'calories': '299 kcal/100gm',
  'price': '333.95',
  'count': 299,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'chicken breast fillet - 1kg',
  'calories': '195 kcal/100gm',
  'price': '199.95',
  'count': 195,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'large baladi bread - 1 piece',
  'calories': '150 kcal/100gm',
  'price': '3.35',
  'count': 150,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'red bell pepper - 1 kg',
  'calories': '30 kcal/100gm',
  'price': '39.95',
  'count': 30,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'cucumber - 1 kg',
  'calories': '15 kcal/100gm',
  'price': '19.95',
  'count': 15,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'balady tomatoes - 1 kg',
  'calories': '20 kcal/100gm',
  'price': '14.95',
  'count': 20,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'date barhy - 1 kg',
  'calories': '283 kcal/100gm',
  'price': '35.95',
  'count': 283,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'potatoes for frying - 1 kg',
  'calories': '274 kcal/100gm',
  'price': '16.95',
  'count': 274,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'shelly mango - 1 kg',
  'calories': '60 kcal/100gm',
  'price': '27.95',
  'count': 60,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'premium white eggs - 30 egg',
  'calories': '51 kcal/100gm',
  'price': '130.95',
  'count': 51,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'premium red eggs - 30 egg',
  'calories': '147 kcal/100gm',
  'price': '132.95',
  'count': 147,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'romy batarekh cheese - 1 kg',
  'calories': '350 kcal/100gm',
  'price': '269.95',
  'count': 350,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'red apples - 1 kg',
  'calories': '52 kcal/100gm',
  'price': '99.95',
  'count': 52,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'imported banana - 1 kg',
  'calories': '89 kcal/100gm',
  'price': '69.95',
  'count': 89,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'sweet potatoes - 1 kg',
  'calories': '90 kcal/100gm',
  'price': '9.95',
  'count': 90,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'carrot - 1 kg',
  'calories': '54 kcal/100gm',
  'price': '24.95',
  'count': 54,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'birell malt drink - 330ml',
  'calories': '16 kcal/100ml',
  'price': '9.50',
  'count': 16,
  'gmORml': 'ml'
  },
  {
  'category': 'food',
  'name': 'pepsi cola can - 330ml',
  'calories': '41 kcal/100ml',
  'price': '9.75',
  'count': 41,
  'gmORml': 'ml'
  },
  {
  'category': 'food',
  'name': 'fayrouz pineapple malt drink - 330ml',
  'calories': '114 kcal/100ml',
  'price': '9.25',
  'count': 114,
  'gmORml': 'ml'
  },
  {
  'category': 'food',
  'name': 'coca cola can - 330ml',
  'calories': '42 kcal/100ml',
  'price': '9.75',
  'count': 42,
  'gmORml': 'ml'
  },
  {
  'category': 'food',
  'name': 'koki plain beef luncheon - 1 kg',
  'calories': '353 kcal/100gm',
  'price': '149.95',
  'count': 353,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'fresh istamboly cheese - 1 kg',
  'calories': '61 kcal/100gm',
  'price': '94.95',
  'count': 61,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'barshoumy fig - 1 kg',
  'calories': '249 kcal/100gm',
  'price': '34.95',
  'count': 249,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'shoky fig',
  'calories': '74 kcal/100gm',
  'price': '4.95',
  'count': 74,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'black grapes - 1 kg',
  'calories': '73 kcal/100gm',
  'price': '34.95',
  'count': 73,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'balady lemons - 1 kg',
  'calories': '29 kcal/100gm',
  'price': '14.95',
  'count': 29,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'tilapia fish - 1 kg',
  'calories': '128 kcal/100gm',
  'price': '99.95',
  'count': 128,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'grouper fish fillet',
  'calories': '232 kcal/100gm',
  'price': '314.95',
  'count': 232,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'small crab female - 1 kg',
  'calories': '97 kcal/100gm',
  'price': '174.95',
  'count': 97,
  'gmORml': 'gm'
  },
  {
  'category': 'food',
  'name': 'pomegranate - 1 kg',
  'calories': '234 kcal/100gm',
  'price': '28.95',
  'count': 234,
  'gmORml': 'gm'
  }
];
insertFood(DataBaseLogic obj){
  for(int i = 0; i < foodx.length; i++){
    obj.insert(category: foodx[i]['category'], name: foodx[i]['name'], calories: foodx[i]['calories'], price: foodx[i]['price'], count: foodx[i]['count'], gmORml: foodx[i]['gmORml']);
  }
}