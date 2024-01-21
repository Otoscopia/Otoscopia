import 'package:flutter/material.dart' as m3;

import 'package:data_table_2/data_table_2.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/core/core.dart';

class SchoolsPatient extends ConsumerWidget {
  const SchoolsPatient(this._patients, {super.key});
  final List<PatientEntity> _patients;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final source = SchoolsPatientTable(ref, _patients);

    return Expanded(
      child: PaginatedDataTable2(
        dividerThickness: 0,
        showCheckboxColumn: false,
        minWidth: 1000,
        empty: const Center(child: Text(kNoDataAvailable)),
        headingRowColor: const m3.MaterialStatePropertyAll(Colors.transparent),
        sortArrowAlwaysVisible: true,
        rowsPerPage: 20,
        source: source,
        columns: const [
          DataColumn2(label: Text(kName)),
          DataColumn2(label: Text(kDoctor)),
        ],
      ),
    );
  }
}

class SchoolsPatientTable extends m3.DataTableSource {
  final WidgetRef ref;
  final List<PatientEntity> _patients;

  SchoolsPatientTable(this.ref, this._patients);

  @override
  m3.DataRow? getRow(int index) {
    return DataRow2(
      cells: [
        m3.DataCell(Text(_patients[index].name)),
        m3.DataCell(Text(_patients[index].doctor)),
      ],
      onSelectChanged: (value) {
        ref.read(dashboardIndexProvider.notifier).setIndex(1);
      },
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _patients.length;

  @override
  int get selectedRowCount => 0;
}
