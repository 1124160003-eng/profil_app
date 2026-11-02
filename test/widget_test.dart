import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:profil_app/main.dart';

void main() {
  testWidgets('Profile page tampil dengan benar', (WidgetTester tester) async {
    await tester.pumpWidget(const MainApp());

    expect(find.text('Profil Pengguna'), findsOneWidget);
    expect(find.text('Given Keo'), findsOneWidget);
    expect(find.text('Mahasiswa Software Engineering'), findsOneWidget);
    expect(find.text('Pengalaman'), findsOneWidget);
  });

  testWidgets('Tombol Edit Profil membuka dialog', (WidgetTester tester) async {
    await tester.pumpWidget(const MainApp());

    await tester.tap(find.text('Edit Profil'));
    await tester.pumpAndSettle();

    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Simpan'), findsOneWidget);
    expect(find.text('Batal'), findsOneWidget);
  });

  testWidgets('Edit nama lalu simpan memperbarui UI', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MainApp());

    await tester.tap(find.text('Edit Profil'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'Nama Baru');
    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();

    expect(find.text('Nama Baru'), findsOneWidget);
    expect(find.text('Given Keo'), findsNothing);
  });
}
