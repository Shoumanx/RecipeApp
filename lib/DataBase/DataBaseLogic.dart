import 'package:bloc/bloc.dart';
import 'package:sqflite/sqflite.dart';

import 'DataBaseState.dart';
import 'foodinsertion.dart';

class DataBaseLogic extends Cubit<DataBaseState>{
  DataBaseLogic() : super(InitState());
  late Database db;
  List needed = [], selectedFood = [];
  int IsIntro = 0, currency = 0, currentCurrency = 0;
  String fullName = '', savedDate = '', maleOrFemale = '';
  Future<void> createDateBase() async {
    db = await openDatabase(
        'u.db',
        version: 1,
        onCreate: (d, v){
          print('Database Created....');
          d.execute('create table orangera '
              '(id integer primary key,'
              'category text,'
              'name text,'
              'calories text,'
              'price text,'
              'count int,'
              'gmORml text)');
          print('Table Created....');
        },
        onOpen: (d) {
          print('Database Opened....');
          showWhat(d, 'IsIntro').then((value) {
            needed = value;
            print('IsIntro: ${needed.length}');
            IsIntro = needed.length;
          });
          showWhat(d, 'fullName').then((value) {
            needed = value;
            print('fullName: ${needed.length}');
            if(needed.length > 0){
              fullName = needed[0]['name'];
              maleOrFemale = needed[0]['gmORml'];
            }
          });
          showWhat(d, 'food').then((value) {
            needed = value;
            if(needed.length > 0)     selectedFood = needed;
          });
          showWhat(d, 'currency').then((value) {
            needed = value;
            print('Currency: ${needed.length}');
            if(needed.length > 0)     currency = needed[0]['count'];
          });
          showWhat(d, 'date').then((value) {
            needed = value;
            print('Date: ${needed.length}');
            if(needed.length > 0)     savedDate = needed[0]['name'];
          });
          showWhat(d, 'currentCurrency').then((value) {
            needed = value;
            print('currentCurreny: ${needed.length}');
            if(needed.length > 0){
              currentCurrency = needed[0]['count'];
              print('currentCurreny: $currentCurrency');
            }
          });
          print('it\'s ok....');
        }
    );
    emit(InitState());
  }

  // Insert Row....
  insert(
      {required String category,
        required String name,
        required String calories,
        required String price,
        required int count,
        required String gmORml}
      ){
    db.transaction((txn) async{
      txn.rawInsert('insert into orangera (category, name, calories, price, count, gmORml) values ("$category", "$name", "$calories", "$price", "$count", "$gmORml")').then((value){
        print('#$value Row inserted...');
      }).onError((error, stackTrace){
        print('JUST ERROR... $error');
        emit(Insertion());
      });
    });
  }


  // Show Row
  Future<List<Map<String, Object?>>> showWhat(Database x, String what) async {
    return await x.rawQuery('select * from orangera WHERE category = ?', [what]);
    // emit(Show());
    // return results;
  }

  // Delete Row
  deleteRow(String category) async{
    int count = await db.rawDelete('DELETE FROM orangera WHERE category = ?', [category]);
    print('Row $count deleted....');
  }


  // Update Row

  updateDate(String newDate)async{
    int n = await db.rawUpdate(
        'UPDATE orangera SET name = ? WHERE category = ?',
        [newDate, 'date']
    );
    print('#Row $n Updated ----> Date...');
    n = await db.rawUpdate(
        'UPDATE orangera SET count = ? WHERE category = ?',
        [currency, 'currentCurrency']
    );
    currentCurrency = currency;
    print('#Row $n Updated ----> currency...');
    emit(Update());
  }


  updateCurrency(Database x, int newCurrency) async {
    int n = await x.rawUpdate(
        'UPDATE orangera SET count = ? WHERE category = ?',
        [newCurrency, 'currentCurrency']
    );
    print('#Row $n Updated ----> currentCurrency...');
    emit(UpdateC());
  }

  search(
      {
        required Database x,
        required String category,
        required String name
      }
      ) async {
    print('name: $name');
    x.rawQuery('SELECT * FROM orangera WHERE category = ? AND name LIKE ?',
        [category, '%$name%']).then((value) {
      selectedFood = value;
    });
    print('Searchedxx....');
    emit(Search());
  }

}