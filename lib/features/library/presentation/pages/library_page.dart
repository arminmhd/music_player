import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_player/app/di/injection_container.dart';
import 'package:my_player/features/library/presentation/bloc/library_bloc.dart';
import 'package:my_player/features/library/presentation/bloc/library_event.dart';
import 'package:my_player/features/library/presentation/pages/library_view.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LibraryBloc>(
      create: (_) => sl<LibraryBloc>()..add(const LoadLibraryEvent()),
      child: const LibraryView(),
    );
  }
}
