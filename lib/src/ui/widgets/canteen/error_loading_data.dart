import 'package:autojidelna/src/_global/providers/canteen.provider.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:flutter/material.dart';

import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';

class ErrorLoadingData extends StatelessWidget {
  const ErrorLoadingData({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.l10n;
    return RefreshIndicator(
      onRefresh: context.read<CanteenProvider>().refreshCurrentPage,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
              Icon(
                Symbols.sentiment_sad,
                size: 250,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.75,
                child: Text(
                  lang.errorsLoadingData,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
            ],
          ),
        ),
      ),
    );
  }
}
