import 'package:drift/drift.dart';

class MovieTable extends Table {
  @override
  Set<Column<dynamic>> get primaryKey => <TextColumn>{id};

  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get poster => text()();
  TextColumn get posterLowResolution => text()();
  RealColumn get voteAverage => real()();
  TextColumn get releaseDate => text()();
  TextColumn get description => text()();
  TextColumn get language => text()();
}

