import 'package:bloc/bloc.dart';
import 'package:project/DataBase/DataBaseState.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseLogic extends Cubit<DataBaseState>{
  DataBaseLogic() : super(InitState());
  late Database db;
  List food = [], intro = [], selectedFood = [];
  int IsIntro = 0;
  createDateBase() {
    openDatabase(
        'u.db',
        version: 1,
        onCreate: (d, v){
          print('Database Created....');
          d.execute('create table orangera '
              '(id integer primary key,'
              ' category text,'
              'name text,'
              'calories text,'
              'price text,'
              'count int)');
          print('Table Created....');
        },
        onOpen: (d) {
          print('Database Opened....');
          showWhat(d, 'food').then((value) {
            food = value;
          });
          showWhat(d, 'IsIntro').then((value) {
            intro = value;
            IsIntro = intro[0]['count'];
          });
        }
    ).then((value) {
      db = value;
    });
  }

  // Insert Row....
  insert(
      {required String category,
        required String name,
        required String calories,
        required String price,
        required int count}
      ){
    db.transaction((txn) async{
      txn.rawInsert('insert into orangera (category, name, calories, price, count) values ("$category", "$name", "$calories", "$price", "$count")').then((value){
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

  UpdateIsIntro(int IsIntro, String category)async{
    int n = await db.rawUpdate(
        'UPDATE orangera SET count = ? WHERE category = ?',
        [IsIntro, category]
    );
    print('#Row $n Updated...');
    emit(Update());
  }


  search(
      {
        required Database x,
        required String category,
        required String name
      }
      ) async {
    x.rawQuery('SELECT * FROM orangera WHERE category = ? AND name LIKE ?',
        [category, '%$name%']).then((value) {
          selectedFood = value;
    });
    print('Searched....');
    emit(Search());
  }
}