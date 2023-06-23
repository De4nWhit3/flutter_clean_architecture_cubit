import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/3_application/core/services/theme_service.dart';
import 'package:flutter_clean_architecture/3_application/core/widgets/custom_button.dart';
import 'package:flutter_clean_architecture/3_application/pages/advice/cubit/adviser_cubit.dart';
import 'package:flutter_clean_architecture/3_application/pages/advice/widgets/advice_field.dart';
import 'package:flutter_clean_architecture/3_application/pages/advice/widgets/error_message.dart';
import 'package:provider/provider.dart';

class AdviserPageWrapperProvider extends StatelessWidget {
  const AdviserPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdviserCubit(),
      child: const AdviserPage(),
    );
  }
}

class AdviserPage extends StatelessWidget {
  const AdviserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My app title',
          style: themeData.textTheme.headlineMedium,
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: Provider.of<ThemeService>(context).isDarkModeOn,
            onChanged: (_) {
              Provider.of<ThemeService>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: BlocBuilder<AdviserCubit, AdviserState>(
                  builder: (context, state) {
                    if (state is AdviceInitial) {
                      return Text(
                        'Your advice is wating for you,',
                        style: themeData.textTheme.bodyMedium,
                      );
                    } else if (state is AdviserStateLoading) {
                      return CircularProgressIndicator(
                        color: themeData.colorScheme.secondary,
                      );
                    } else if (state is AdviserStateLoaded) {
                      return AdviceField(advice: state.advice);
                    } else if (state is AdviserStateError) {
                      return ErrorMessage(message: state.errorMessage);
                    }
                    return const ErrorMessage(message: '404');
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 200,
              child: Center(
                child: CustomButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
