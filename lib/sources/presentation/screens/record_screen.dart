import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/dream_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // DreamProvider에 접근
    var dreamProvider = Provider.of<DreamProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          Consumer<DreamProvider>(
            builder: (context, provider, child) {
              return TextButton(
                onPressed: provider.isSaveButtonEnabled ? () => _showSaveDialog(context, provider) : null,
                child: Text(AppLocalizations.of(context)!.save),
              );
            },
          ),
        ],
        title: Text(AppLocalizations.of(context)!.recordDream),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: (text) => dreamProvider.updateDreamText(text),
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(hintText: AppLocalizations.of(context)!.enterYourDream),
        ),
      ),
    );
  }

  void _showSaveDialog(BuildContext context, DreamProvider provider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.notice),
          content: Text(AppLocalizations.of(context)!.alertMessageForSavingDream),
          actions: <Widget>[
            TextButton(
              child: Text(AppLocalizations.of(context)!.cancel),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text(AppLocalizations.of(context)!.save),
              onPressed: () {
                provider.saveDream();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
